class ProcessResponse {
  String? processId;
  bool? isSuccess;
  String? errorMsj;

  ProcessResponse({this.processId, this.isSuccess, this.errorMsj});

  ProcessResponse.fromJson(Map<String, dynamic> json) {
    processId = json['processId'];
    isSuccess = json['isSuccess'];
    errorMsj = json['errorMsj'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['processId'] = processId;
    data['isSuccess'] = isSuccess;
    data['errorMsj'] = this.errorMsj;
    return data;
  }
}
