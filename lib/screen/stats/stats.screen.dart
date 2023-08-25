import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';
import 'package:rokeapp/widgets/pie.chart.widget.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});
  static String routeName = "/StatsScreen";
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
      height: MediaQuery.sizeOf(context).height * .69,
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
                      color: Color(0xff00409F),
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset(
                    'assets/stats.svg',
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Mis Asignaciones",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildStats(context)
        ],
      ),
    );
  }

  _buildStats(BuildContext context) {
    List<PieData> dataChar = [
      PieData("COMPLETADAS 30%", 30, "opcion 1"),
      PieData("PENDIENTES 30%", 30, "opcion 2"),
      PieData("CANCELADAS 40%", 40, "opcion 2"),
    ];
    return PieChart(data: dataChar);
  }
}
