import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rokeapp/config/constants.dart';
import 'package:rokeapp/contracts/auth.contract.dart';
import 'package:rokeapp/models/credentials.model.dart';
import 'package:rokeapp/models/processResponse.model.dart';

class AuthService implements AuthContract {
  @override
  Future<ProcessResponse> login(Credentials info) async {
    ProcessResponse dataResponse = ProcessResponse(isSuccess: false);
    try {
      http.Response? response;
      response = await http.post(
          Uri.parse('${serverurl}api/user/login'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, String>{
            'username': info.email!,
            'password': info.password!
          }));

      if (response.statusCode == 200) {
        // dataResponse = LoginResponse.fromJson(jsonDecode(response.body));
        dataResponse.isSuccess = true;

        return dataResponse;
      } else {
        dataResponse.isSuccess = false;

        if (response.statusCode == 404) {
          return dataResponse;
        } else {
          // dataResponse = LoginResponse.fromJson(jsonDecode(response.body));
          return dataResponse;
        }
      }
    } catch (e) {
      print(e.toString());
      return dataResponse!;
    }
  }

  @override
  Future<ProcessResponse> register() {
    // TODO: implement register
    throw UnimplementedError();
  }

  // @override
  // Future<ProcessResponse> signin(Credentials info) async {
  //   LoginResponse dataResponse = LoginResponse(success: false);
  //   try {
  //     Response? response;
  //     response = await http.post(
  //         Uri.parse('http://23.19.226.29/api/user/login'),
  //         headers: <String, String>{
  //           'Content-Type': 'application/json',
  //         },
  //         body: jsonEncode(<String, String>{
  //           'email': info.email!,
  //           'password': info.password!
  //         }));

  //     if (response.statusCode == 200) {
  //       dataResponse = LoginResponse.fromJson(jsonDecode(response.body));
  //       return dataResponse;
  //     } else {
  //       if (response.statusCode == 404) {
  //         return dataResponse;
  //       } else {
  //         dataResponse = LoginResponse.fromJson(jsonDecode(response.body));
  //         return dataResponse;
  //       }
  //     }
  //   } catch (e) {
  //     print(e.toString());
  //     return dataResponse!;
  //   }
  // }
}
