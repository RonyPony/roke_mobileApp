import 'package:flutter/material.dart';
import 'package:rokeapp/contracts/auth.contract.dart';
import 'package:rokeapp/models/credentials.model.dart';
import 'package:rokeapp/models/processResponse.model.dart';

class AuthProvider with ChangeNotifier {
  final AuthContract _contrato;
  AuthProvider(this._contrato);

  Future<ProcessResponse> login(Credentials cred) {
    return _contrato.login(cred);
  }
}
