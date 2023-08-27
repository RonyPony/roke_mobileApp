import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/screen/finalWorkInform/finalWorkInform.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';
import 'package:rokeapp/widgets/photoPicker.widget.dart';

import '../../widgets/chip.widget.dart';
import '../../widgets/rokeButton.widget.dart';

class WorkInCompleted extends StatefulWidget {
  const WorkInCompleted({super.key});

  static String routeName = "/WorkInCompleted";

  @override
  State<WorkInCompleted> createState() => _WorkInCompletedState();
}

class _WorkInCompletedState extends State<WorkInCompleted> {
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
            child: Column(
              children: [
                _buildHeaderTitle(),
                _buildPane(context),
                const SizedBox(
                  height: 20,
                )
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
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffAC8700),
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset('assets/task.svg'),
                ),
                const SizedBox(
                  width: 20,
                ),
                Text(
                  "Asignacion $_id",
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xffAC8700)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildDetails(context),
          Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: RokeButton(
              icon: SvgPicture.asset("assets/lock.svg"),
              text: "cerrar solicitud",
            ),
          )
        ],
      ),
    );
  }

  _buildDetails(BuildContext context) {
    double spaceBetweenFields = MediaQuery.sizeOf(context).height * .03;
    double spaceBetweenLines = MediaQuery.sizeOf(context).height * .02;
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        width: MediaQuery.sizeOf(context).width * .8,
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
        decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Text(
              "TRABAJO COMPLETADO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: spaceBetweenFields,
            ),
            SvgPicture.asset('assets/jobdone.svg'),
            Text("HORA DE FINALIZACION"),
            Text(
              "3:56 PM",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                    width: 310,
                    child: RokeChip(
                      s: 'completar reporte de trabajo',
                      uri: FinalWorkInform.routeName,
                      isLocalUrl: true,
                      icon: SvgPicture.asset("assets/report.svg"),
                      localArguments: _id,
                    )),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "COMPLETA EL REPORTE PARA FINALIZAR LA SOLICITUD",
              style: TextStyle(color: Colors.red.withOpacity(.5)),
            )
          ],
        ),
      ),
    );
  }
}
