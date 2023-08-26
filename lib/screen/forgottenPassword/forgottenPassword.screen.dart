import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/widgets/mainBtn.widget.dart';
import 'package:rokeapp/widgets/textField.widget.dart';

class ForgottenPasswordScreen extends StatelessWidget {
  const ForgottenPasswordScreen({super.key});
  static String routeName = "/ForgottenPasswordScreen";
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
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
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
                                "RECUPERAR CLAVE",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                              const SizedBox(
                                width: 8,
                              ),
                              Container(
                                height: 1,
                                width: MediaQuery.sizeOf(context).width * .2,
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        const RokeTextField(placeHolder: "email"),
                        Container(
                          height: 1,
                          width: MediaQuery.sizeOf(context).width * .7,
                          decoration: const BoxDecoration(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              const RokeMainBtn(text: "solicitar"),
            ],
          ),
        ),
      )
    ]);
  }
}
