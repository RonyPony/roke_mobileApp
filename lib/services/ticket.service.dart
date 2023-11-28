import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rokeapp/config/constants.dart';
import 'package:rokeapp/contracts/ticket.contract.dart';
import 'package:rokeapp/models/ticket.model.dart';

class TicketService implements TicketContract {
  @override
  Future<List<Ticket>> getAllTickets() async {
    List<Ticket> foundTicket = <Ticket>[];
    try {
      var resp = await http.get(Uri.parse('${serverurl}api/Ticket'));
      if(resp.statusCode == 200){
        List<dynamic> data = jsonDecode(resp.body);
        for (var item in data) {
          foundTicket.add(Ticket.fromJson(item));
        }
        // var list  = Ticket.fromJson(data);
        // foundTicket = list.map<Ticket>((sample) => Ticket(
        //   id: sample["id"],
        //   code: sample["code"],
        //   createdOn: sample["createdOn"],
        //   enabled: sample["enabled"],
        //   name: sample["name"],
        //   updatedOn: sample["updatedOn"])).toList();
        // // foundTicket;
        return foundTicket;
      }

      if(resp.statusCode=="404"){
        print("Ticket Not Found");
      }
      return foundTicket;
    } 
    on HttpException catch (e) {
      //http error(statusCode not 20x) will be catched here.
      print(e.message.toString());
      print(
          'Failed Load Data with status code ${e.message}');
          return foundTicket;
    }
    catch(e){
      print(e);
      return foundTicket;
    }
  }

  @override
  Future<Ticket> getTicketById(String id) async {
    Ticket foundTicket = Ticket();
    try {
      var resp = await http.get(Uri.parse('${serverurl}api/Ticket/$id'));
      if(resp.statusCode == 200){
        Map<String,dynamic> data = jsonDecode(resp.body);
        // for (var item in data) {
        //   foundTicket=Ticket.fromJson(item);
        // }
        foundTicket = Ticket.fromJson(data);
        return foundTicket;
      }

      if(resp.statusCode=="404"){
        print("Ticket Not Found");
      }
      return foundTicket;
    }catch(ex){
      return foundTicket;
    }
  }
 
}
