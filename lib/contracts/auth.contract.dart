import 'package:rokeapp/models/credentials.model.dart';
import 'package:rokeapp/models/processResponse.model.dart';

abstract class AuthContract {
  Future<ProcessResponse> login(Credentials cred);
  Future<ProcessResponse> register();
}
