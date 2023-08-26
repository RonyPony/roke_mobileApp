import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AssignmentsDetail extends StatefulWidget {
  const AssignmentsDetail({super.key});

  static String routeName = "/AssigmentDetails";

  @override
  State<AssignmentsDetail> createState() => _AssignmentsDetailState();
}

class _AssignmentsDetailState extends State<AssignmentsDetail> {
  late int _id;
  @override
  void initState() {
    // TODO: implement initState
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
              children: [_buildHeaderTitle(), _buildPane(context)],
            ),
          ),
        ),
      )
    ]);
  }

  _buildHeaderTitle() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20),
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
    return BottomMenu();
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
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xffAC8700),
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset('assets/task.svg'),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Asignacion ${_id}",
                  style: TextStyle(fontSize: 20, color: Color(0xffAC8700)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildDetails(context)
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
        padding: EdgeInsets.only(left: 20, top: 10, bottom: 20),
        decoration: BoxDecoration(
            color: Color(0xffD9D9D9), borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Text(
              "DETALLES DE LA SOLICITUD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                Text(
                  "TIPO DE SOLICITUD",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Text("Mantenimiento de aire acondicionado"),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                Text(
                  "UBICACION DE LA SOLICITUD",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                _buildChip("mapa",
                    "https://www.google.com/maps/place/Colmado+el+Tri%C3%A1ngulo/@18.4736664,-69.8611164,15z/data=!4m6!3m5!1s0x8eaf87e6f8023bb9:0x5b9419ef3465276e!8m2!3d18.4736966!4d-69.8508367!16s%2Fg%2F11dflr39fl?entry=ttu")
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Text("DGII SUC. MAXIMO GOMEZ"),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                Text(
                  "NOMBRE DE CONTACTO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Text("LIC. ERNESTO CARBAJAL"),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                Text(
                  "NUMERO DE CONTACTO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Text("+1 (809) 716-2373"),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                Text(
                  "DETALLE",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Color(0xffB0B0B0),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                    "ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo ejemplo "),
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildChip(String s, String uri) {
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
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          decoration: BoxDecoration(
              color: Color(0xffFF7A00),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/location.svg',
                color: Colors.white,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                s.toUpperCase(),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
