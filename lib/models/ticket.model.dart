class Ticket {
  String? id;
  int? status;
  String? createdOn;
  String? updatedOn;
  String? description;
  String? ticketType;
  String? contactName;
  String? contactNumber;
  bool? contactHasWhatsapp;
  String? brigadeId;
  String? locationId;
  String? assignedUserId;
  String? idmedia;

  Ticket(
      {this.id,
      this.status,
      this.createdOn,
      this.updatedOn,
      this.description,
      this.ticketType,
      this.contactName,
      this.contactNumber,
      this.contactHasWhatsapp,
      this.brigadeId,
      this.locationId,
      this.assignedUserId,
      this.idmedia});

  Ticket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdOn = json['createdOn'];
    updatedOn = json['updatedOn'];
    description = json['description'];
    ticketType = json['ticketType'];
    contactName = json['contactName'];
    contactNumber = json['contactNumber'];
    contactHasWhatsapp = json['contactHasWhatsapp'];
    brigadeId = json['brigadeId'];
    locationId = json['locationId'];
    assignedUserId = json['assignedUserId'];
    idmedia = json['idmedia'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['status'] = this.status;
    data['createdOn'] = this.createdOn;
    data['updatedOn'] = this.updatedOn;
    data['description'] = this.description;
    data['ticketType'] = this.ticketType;
    data['contactName'] = this.contactName;
    data['contactNumber'] = this.contactNumber;
    data['contactHasWhatsapp'] = this.contactHasWhatsapp;
    data['brigadeId'] = this.brigadeId;
    data['locationId'] = this.locationId;
    data['assignedUserId'] = this.assignedUserId;
    data['idmedia'] = this.idmedia;
    return data;
  }
}