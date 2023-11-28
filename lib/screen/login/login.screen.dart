import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rokeapp/models/credentials.model.dart';
import 'package:rokeapp/models/processResponse.model.dart';
import 'package:rokeapp/provider/auth.provider.dart';
import 'package:rokeapp/screen/home/home.screen.dart';
import 'package:rokeapp/widgets/mainBtn.widget.dart';
import 'package:rokeapp/widgets/textField.widget.dart';

import '../forgottenPassword/forgottenPassword.screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});
  static String routeName = "/loginScreen";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailInput = TextEditingController();

  TextEditingController _passwordInput = TextEditingController();

  String errMsj = '';

  @override
  Widget build(BuildContext context) {
    
    return Stack(children: [
      Image.asset(
        "assets/background1.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, top: 20, bottom: 40),
                      child: Image.asset(
                        'assets/logo.png',
                        height: MediaQuery.sizeOf(context).width * .3,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.sizeOf(context).height * .42,
                      width: MediaQuery.sizeOf(context).width * .9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(.7)),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Row(
                              children: [
                                const Text(
                                  "ACCEDER",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 25),
                                ),
                                const SizedBox(
                                  width: 8,
                                ),
                                Container(
                                  height: 1,
                                  width: MediaQuery.sizeOf(context).width * .48,
                                  decoration:
                                      const BoxDecoration(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          RokeTextField(
                            placeHolder: "email",
                            receivedController: _emailInput,
                          ),
                          RokeTextField(
                            placeHolder: "clave",
                            isPassword: true,
                            receivedController: _passwordInput,
                          ),
                          Container(
                            height: 1,
                            width: MediaQuery.sizeOf(context).width * .7,
                            decoration:
                                const BoxDecoration(color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10),
                  child: Text(
                    errMsj,
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                GestureDetector(
                    onTap: () async {
                      showMessage("");
                      final _auth =
                          Provider.of<AuthProvider>(context, listen: false);
                      Credentials cred = Credentials(
                          email: _emailInput.text,
                          password: _passwordInput.text);
                      ProcessResponse loguedin = await _auth.login(cred);
                      if (!validarEmail(_emailInput.text)) {
                        showMessage("Correo electronico no valido");
                        return;
                      }
                      if (!validarContrasena(_passwordInput.text)) {
                        showMessage("Clave es requerida");
                        return;
                      }
                      if (loguedin.isSuccess!) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                            HomeScreen.routeName, (route) => false);
                      } else {
                        showMessage("Credenciales Incorrectas");
                      }
                    },
                    child: const RokeMainBtn(text: "entrar")),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(ForgottenPasswordScreen.routeName);
                  },
                  child: const Text(
                    "OLVIDASTE TU CLAVE ?",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ]);
  }

  bool validarEmail(String email) {
  // Expresión regular para validar un email
  RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return regex.hasMatch(email);
}


  void showMessage(String s) {
    setState(() {
      errMsj = s;
    });
    
  }
  
    bool validarContrasena(String contrasena) {
  // Verificar la longitud mínima de la contraseña
  if (contrasena.length < 1) {
    return false;
  }

  // // Verificar si contiene al menos una letra mayúscula
  // if (!contrasena.contains(RegExp(r'[A-Z]'))) {
  //   return false;
  // }

  // // Verificar si contiene al menos una letra minúscula
  // if (!contrasena.contains(RegExp(r'[a-z]'))) {
  //   return false;
  // }

  // // Verificar si contiene al menos un número
  // if (!contrasena.contains(RegExp(r'[0-9]'))) {
  //   return false;
  // }

  // // Verificar si contiene al menos un carácter especial
  // if (!contrasena.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
  //   return false;
  // }

  // Si cumple con todos los criterios, la contraseña es válida
  return true;
}

  }

