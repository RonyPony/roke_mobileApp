import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/screen/workCompleted/workCompleted.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';
import 'package:rokeapp/widgets/photoPicker.widget.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/rokeButton.widget.dart';

class WorkInProgress extends StatefulWidget {
  const WorkInProgress({super.key});

  static String routeName = "/WorkInProgress";

  @override
  State<WorkInProgress> createState() => _WorkInProgressState();
}

class _WorkInProgressState extends State<WorkInProgress> {
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
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, WorkInCompleted.routeName, (route) => false,
                    arguments: _id);
              },
              child: RokeButton(
                text: "trabajo terminado",
              ),
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
              "TRABAJO EN PROCESO",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: spaceBetweenFields,
            ),
            SvgPicture.asset('assets/working.svg'),
            Text("HORA DE INICIO"),
            Text(
              "1:45 PM",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            const PhotoPicker(),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 270,
              child: _buildChip("chatea con el encargado", "uri",
                  SvgPicture.asset("assets/whatsapp.svg")),
            ),
          ],
        ),
      ),
    );
  }

  _buildChip(String s, String uri, SvgPicture icon) {
    return Padding(
      padding: const EdgeInsets.only(left: 20),
      child: GestureDetector(
        onTap: () async {
          // if (!await launchUrl(Uri.parse(uri))) {
          //   throw Exception('Could not launch $uri');
          // }
          if (!await launchUrl(
            Uri.parse(uri),
            mode: LaunchMode.inAppWebView,
            webViewConfiguration: const WebViewConfiguration(
                enableDomStorage: true, enableJavaScript: true),
          )) {
            throw Exception('Could not launch $uri');
          }
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: const Color(0xffFF7A00),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              icon,
              const SizedBox(
                width: 5,
              ),
              Text(
                s.toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
