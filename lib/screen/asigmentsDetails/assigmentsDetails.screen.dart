import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';

class AssigmentDetails extends StatelessWidget {
  const AssigmentDetails({super.key});
  static String routeName = "/AssigmentDetails";
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
          child: Column(
            children: [_buildHeaderTitle(), _buildPane(context)],
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
                style: TextStyle(color: Colors.white, fontSize: 28),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                "Aqui estamos, listos y a tus ordenes",
                style: TextStyle(color: Colors.white, fontSize: 20),
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
      height: MediaQuery.sizeOf(context).height * .75,
      width: MediaQuery.sizeOf(context).width * .85,
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
                  "Mis Asignaciones",
                  style: TextStyle(fontSize: 20, color: Color(0xffAC8700)),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildList(context)
        ],
      ),
    );
  }

  _buildList(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .6,
      width: MediaQuery.sizeOf(context).width * .80,
      child: ListView.builder(
        itemCount: 4000,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                leading: SvgPicture.asset('assets/pendingtask.svg'),
                subtitle: Row(
                  children: [
                    SvgPicture.asset('assets/location.svg'),
                    Text("Av. Maximo Gomez " + index.toString()),
                  ],
                ),
                title: Text("Mantenimiento " + (index + 1).toString()),
              ),
            ),
          );
        },
      ),
    );
  }
}
