import 'package:flutter/cupertino.dart';
import 'package:rokeapp/screen/asigmentsDetailsList/assigmentsDetailsList.screen.dart';
import 'package:rokeapp/screen/completedasigmentsList/completedAssigmentsList.screen.dart';
import 'package:rokeapp/screen/finalWorkInform/finalWorkInform.dart';
import 'package:rokeapp/screen/forgottenPassword/forgottenPassword.screen.dart';
import 'package:rokeapp/screen/home/home.screen.dart';
import 'package:rokeapp/screen/landing/landing.screen.dart';
import 'package:rokeapp/screen/login/login.screen.dart';
import 'package:rokeapp/screen/onTheWay/onTheWay.screen.dart';
import 'package:rokeapp/screen/stats/stats.screen.dart';
import 'package:rokeapp/screen/workCompleted/workCompleted.dart';
import 'package:rokeapp/screen/workInProgress/workInProgress.dart';

import '../screen/asigmentsDetails/assigmentsDetails.screen.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    LandingPage.routeName: (BuildContext context) => const LandingPage(),
    LoginScreen.routeName: (BuildContext context) => LoginScreen(),
    ForgottenPasswordScreen.routeName: (BuildContext context) =>
        const ForgottenPasswordScreen(),
    HomeScreen.routeName: (BuildContext context) => const HomeScreen(),
    AssignmentsDetailList.routeName: (BuildContext context) =>
        const AssignmentsDetailList(),
    AssignmentsDetail.routeName: (BuildContext context) =>
        const AssignmentsDetail(),
    CompletedAssignments.routeName: (BuildContext context) =>
        const CompletedAssignments(),
    StatsScreen.routeName: (BuildContext context) => const StatsScreen(),
    OnTheWay.routeName: (BuildContext context) => const OnTheWay(),
    WorkInProgress.routeName: (BuildContext context) => const WorkInProgress(),
    WorkInCompleted.routeName: (BuildContext contex) => const WorkInCompleted(),
    FinalWorkInform.routeName: (BuildContext context) => const FinalWorkInform()
  };
}
