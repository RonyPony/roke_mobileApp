import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rokeapp/models/ticket.model.dart';
import 'package:rokeapp/provider/ticket.provider.dart';
import 'package:rokeapp/screen/asigmentsDetails/assigmentsDetails.screen.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';

class AssignmentsDetailList extends StatelessWidget {
  const AssignmentsDetailList({super.key});
  static String routeName = "/AssigmentDetailsList";
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
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color(0xffAC8700),
                      borderRadius: BorderRadius.circular(50)),
                  child: SvgPicture.asset('assets/task.svg'),
                ),
                const SizedBox(
                  width: 20,
                ),
                const Text(
                  "Mis Asignaciones",
                  style: TextStyle(fontSize: 20, color: Color(0xffAC8700)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<Widget>(
            future: _buildList(context),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return LinearProgressIndicator();
              }
              if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError) {
                return snapshot.data!;
              }
              return CircularProgressIndicator();
            },
          )
        ],
      ),
    );
  }

  String validateTextLength(String text,int maxChars){
    if (text.length>maxChars) {
      return '${text.substring(0,maxChars)}...';
    }else{
      return text;
    }
  }

  String validateLocationName(String locationId){
    if (locationId =="00000000-0000-0000-0000-000000000000") {
      return "Ubicacion no especificada";
    }else{
      return locationId;
    }
  }

  Future<Widget> _buildList(BuildContext context) async {
    final _ticketProvider =Provider.of<TicketProvider>(context, listen: false);
    List<Ticket> ticketList = await _ticketProvider.getAll();
    if (ticketList.length==0) {
      return Column(
        children: [
          SvgPicture.asset('assets/jobdone.svg'),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text("No hay asignaciones pendientes",style: TextStyle(color: Colors.white,fontSize: 21),),
          ),
        ],
      );
    }
    return SizedBox(
      height: MediaQuery.sizeOf(context).height * .5,
      width: MediaQuery.sizeOf(context).width * .80,
      child: ListView.builder(
        itemCount: ticketList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, AssignmentsDetail.routeName,
                      arguments: ticketList[index].id);
                },
                leading: SvgPicture.asset('assets/pendingtask.svg'),
                subtitle: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset('assets/done.svg',color: Colors.yellow.shade600,height: 25,),
                          Text("Tipo: "),
                          Text(validateTextLength(ticketList[index].ticketType!,20)),
                        ],
                      ),
                       Row(
                        children: [
                          SvgPicture.asset('assets/location.svg'),
                          Text(validateTextLength(validateLocationName(ticketList[index].locationId!),20)),
                        ],
                      ),
                    ],
                  ),
                ),
                title: Text(validateTextLength(ticketList[index].description!,20)),
              ),
            ),
          );
        },
      ),
    );
  }
}
