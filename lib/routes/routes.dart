import 'package:flutter/cupertino.dart';
import 'package:rokeapp/screen/asigmentsDetails/assigmentsDetails.screen.dart';
import 'package:rokeapp/screen/forgottenPassword/forgottenPassword.screen.dart';
import 'package:rokeapp/screen/home/home.screen.dart';
import 'package:rokeapp/screen/landing/landing.screen.dart';
import 'package:rokeapp/screen/login/login.screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    LandingPage.routeName: (BuildContext context) => const LandingPage(),
    LoginScreen.routeName: (BuildContext context) => const LoginScreen(),
    ForgotenPasswordScreen.routeName: (BuildContext context) =>
        const ForgotenPasswordScreen(),
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    AssigmentDetails.routeName: (BuildContext context) =>
        const AssigmentDetails(),
  };
}
