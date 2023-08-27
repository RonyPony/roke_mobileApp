import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/screen/workCompleted/workCompleted.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';
import 'package:rokeapp/widgets/photoPicker.widget.dart';
import 'package:rokeapp/widgets/textField.widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/rokeButton.widget.dart';

class FinalWorkInform extends StatefulWidget {
  const FinalWorkInform({super.key});

  static String routeName = "/FinalWorkInform";

  @override
  State<FinalWorkInform> createState() => _FinalWorkInformState();
}

class _FinalWorkInformState extends State<FinalWorkInform> {
  late int _id;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as int;
    _id = arguments;
    return Stack(children: [
      Image.asset(
        "assets/background1.png",
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.cover,
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        bottomNavigationBar: _buildBottomMenu(context),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    _buildPane(context),
                    const SizedBox(
                      height: 20,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      )
    ]);
  }

  _buildHeaderTitle() {
    return const Padding(
      padding: EdgeInsets.only(top: 20, left: 20),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Bienvenido de vuelta Marcos",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Aqui estamos, listos y a tus ordenes",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  _buildBottomMenu(BuildContext context) {
    return const BottomMenu();
  }

  _buildPane(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * .9,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.4),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          _buildDetails(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30, top: 40),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, WorkInCompleted.routeName, (route) => false,
                    arguments: _id);
              },
              child: Container(
                width: 350,
                child: RokeButton(
                  text: "COMPLETAR",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildDetails(BuildContext context) {
    double spaceBetweenFields = MediaQuery.sizeOf(context).height * .03;

    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Text(
              "REPORTE FINAL DE TRABAJO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: spaceBetweenFields,
            ),
            _buildQuestion("pregunta 1"),
            _buildQuestion("pregunta 2"),
            _buildQuestion("pregunta 3"),
            _buildQuestion("pregunta 4"),
            Padding(
              padding: const EdgeInsets.only(bottom: 25),
              child: PhotoPicker(
                placeholder: "Tomar foto final",
                buttonWidth: 45,
                spaceBetweenFields: 10,
              ),
            ),
            RokeTextField(
                placeHolder: "comentarios",
                isLongText: true,
                widthAdjustment: .70,
                keyboardType: TextInputType.multiline,
                maxline: null),
          ],
        ),
      ),
    );
  }

  _buildQuestion(String placeHolder) {
    return RokeTextField(
      placeHolder: placeHolder,
      widthAdjustment: .70,
    );
  }
}
