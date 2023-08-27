import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/screen/asigmentsDetailsList/assigmentsDetailsList.screen.dart';
import 'package:rokeapp/screen/completedasigmentsList/completedAssigmentsList.screen.dart';
import 'package:rokeapp/screen/stats/stats.screen.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String routeName = "/homeScreen";
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
              children: [
                _buildHeaderTitle(),
                _buildKPIs(context),
                _buildOptions(context),
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

  _buildKPIs(BuildContext context) {
    List<LinearGradient> gradients = [
      const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff06B6C1), Color(0xff9B53A7), Color(0xffFF5C00)],
      ),
      const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff960087), Color(0xffBDA3BB), Color(0xffADFF00)],
      ),
      const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff030096), Color(0xffFFFFFF), Color(0xffFF0000)],
      ),
    ];
    Map<int, String> data = {
      129: "asignaciones completadas",
      127: "asignaciones pendientes por trabajar",
      29: "horas trabajadas"
    };
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Row(
        children: [
          SizedBox(
            height: 150,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
                    decoration: BoxDecoration(
                        gradient: gradients[index],
                        borderRadius: BorderRadius.circular(30)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              data.entries.toList()[index].key.toString(),
                              style:
                                  const TextStyle(fontSize: 60, color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              data.entries
                                  .toList()[index]
                                  .value
                                  .toString()
                                  .toUpperCase(),
                              style: const TextStyle(color: Colors.white),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  _buildOptions(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Container(
        // decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(AssignmentsDetailList.routeName);
                  },
                  child: _buildAnOption(
                      "asignaciones",
                      SvgPicture.asset('assets/task.svg'),
                      const Color(0xffAC8700),
                      context),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CompletedAssignments.routeName);
                  },
                  child: _buildAnOption(
                      "completadas",
                      SvgPicture.asset('assets/done.svg'),
                      const Color(0xff0E6500),
                      context),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(StatsScreen.routeName);
                  },
                  child: _buildAnOption(
                      "estadisticas",
                      SvgPicture.asset('assets/stats.svg'),
                      const Color(0xffB1B1B1),
                      context),
                ),
                _buildAnOption(
                    "identificacion",
                    SvgPicture.asset('assets/carnet.svg'),
                    const Color(0xff0A87BC),
                    context)
              ],
            )
          ],
        ),
      ),
    );
  }

  _buildAnOption(
      String s, SvgPicture svgPicture, Color red, BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.sizeOf(context).width * .05, top: 10, bottom: 10),
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.4),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: red, borderRadius: BorderRadius.circular(50)),
                child: svgPicture),
            const SizedBox(
              height: 10,
            ),
            Text(
              s.toUpperCase(),
              style: TextStyle(color: red),
            )
          ],
        ),
      ),
    );
  }

  _buildBottomMenu(BuildContext context) {
    return const BottomMenu();
  }
}
