import 'package:flutter/material.dart';
import 'package:rokeapp/contracts/ticket.contract.dart';
import 'package:rokeapp/models/ticket.model.dart';

class TicketProvider with ChangeNotifier {
  final TicketContract _contrato;
  TicketProvider(this._contrato);

  Future<List<Ticket>> getAll() {
    return _contrato.getAllTickets();
  }
  Future<Ticket>getById(String id){
    return _contrato.getTicketById(id);
  }
}
