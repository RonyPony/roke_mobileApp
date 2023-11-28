import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rokeapp/models/ticket.model.dart';
import 'package:rokeapp/provider/ticket.provider.dart';
import 'package:rokeapp/screen/onTheWay/onTheWay.screen.dart';
import 'package:rokeapp/widgets/bottomMenu.widget.dart';

import '../../widgets/chip.widget.dart';
import '../../widgets/rokeButton.widget.dart';

class AssignmentsDetail extends StatefulWidget {
  const AssignmentsDetail({super.key});
  
  static String routeName = "/AssigmentDetails";

  @override
  State<AssignmentsDetail> createState() => _AssignmentsDetailState();
}

class _AssignmentsDetailState extends State<AssignmentsDetail> {
  late String _id;
  Ticket currentTicket = Ticket();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <dynamic, dynamic>{}) as String;
    _id = arguments;
    loadTicketInfo();
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
                _buildForm(context),
                
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

  _buildPane(BuildContext context,Ticket ticketInfo) {
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
                  "Asignacion",
                  style:
                      const TextStyle(fontSize: 20, color: Color(0xffAC8700)),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _buildDetails(context,ticketInfo),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, OnTheWay.routeName, (route) => false,
                    arguments: _id);
              },
              child: const RokeButton(
                text: "iniciar trabajo",
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildDetails(BuildContext context,Ticket ticketInfo) {
    double spaceBetweenFields = MediaQuery.sizeOf(context).height * .03;
    double spaceBetweenLines = MediaQuery.sizeOf(context).height * .02;
    String latitud = "18.5029526";
    String longitud = "-69.7763375";
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 20),
        decoration: BoxDecoration(
            color: const Color(0xffD9D9D9),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            const Text(
              "DETALLES DE LA SOLICITUD",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: spaceBetweenFields,
            ),
            const Row(
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
             Text(ticketInfo.ticketType!),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                const Text(
                  "UBICACION DE LA SOLICITUD",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RokeChip(
                  s: 'mapa',
                  uri:'https://www.google.com/maps/search/?api=1&query=$latitud,$longitud',
                  isLocalUrl: false,
                  icon: SvgPicture.asset(
                    'assets/location.svg',
                    color: Colors.white,
                  ),
                )
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Text(ticketInfo.locationId!),
            SizedBox(
              height: spaceBetweenFields,
            ),
            const Row(
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
             Text(ticketInfo.contactName!),
            SizedBox(
              height: spaceBetweenFields,
            ),
            Row(
              children: [
                const Text(
                  "NUMERO DE CONTACTO",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                RokeChip(
                  s: 'whatsapp',
                  uri:"https://api.whatsapp.com/send?phone=${ticketInfo.contactNumber}&text=Hola%20te%20contacto%20para%20tratar%20un%20tema%20sobre%20la%20solicitud%20de%20${ticketInfo.ticketType}%20a%20nombre%20de%20${ticketInfo.contactName}",
                  // uri: "https://google.com",
                  isLocalUrl: false,
                  icon: SvgPicture.asset(
                    'assets/whatsapp.svg',
                  ),
                )
              ],
            ),
            SizedBox(
              height: spaceBetweenLines,
            ),
            Text(ticketInfo.contactNumber!),
            SizedBox(
              height: spaceBetweenFields,
            ),
            const Row(
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
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xffB0B0B0),
                    borderRadius: BorderRadius.circular(20)),
                child:  Text(ticketInfo.description!),
              ),
            )
          ],
        ),
      ),
    );
  }
  
  Future<Ticket> loadTicketInfo() async {
    final _ticketProvider =Provider.of<TicketProvider>(context, listen: false);
    Ticket ticketFound = await _ticketProvider.getById(_id);
    return ticketFound;
  }
  
  _buildForm(BuildContext context) {
    return FutureBuilder(
      future: loadTicketInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LinearProgressIndicator();
        }
        if (snapshot.connectionState == ConnectionState.done && !snapshot.hasError) {
          return _buildPane(context,snapshot.data!);
        }
        return CircularProgressIndicator();
      },
    );
  }
}
