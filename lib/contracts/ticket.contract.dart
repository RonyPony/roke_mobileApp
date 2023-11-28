import 'package:rokeapp/models/ticket.model.dart';

abstract class TicketContract {
  Future<List<Ticket>> getAllTickets();
  Future<Ticket>getTicketById(String id);
}
