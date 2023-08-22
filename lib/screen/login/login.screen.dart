import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/widgets/mainBtn.widget.dart';
import 'package:rokeapp/widgets/textField.widget.dart';

import '../forgottenPassword/forgottenPassword.screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String routeName = "/loginScreen";
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 40, top: 20, bottom: 40),
                    child: Image.asset('assets/logo.png'),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height * .36,
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
                              Text(
                                "ACCEDER",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.sizeOf(context).width * .48,
                                decoration: BoxDecoration(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        RokeTextField(placeHolder: "email"),
                        RokeTextField(placeHolder: "clave"),
                        Container(
                          height: 1,
                          width: MediaQuery.sizeOf(context).width * .7,
                          decoration: BoxDecoration(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              RokeMainBtn(text: "entrar"),
              SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(ForgotenPasswordScreen.routeName);
                },
                child: Text(
                  "OLVIDASTE TU CLAVE ?",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      )
    ]);
  }
}
