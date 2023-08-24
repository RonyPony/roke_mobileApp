import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/screen/login/login.screen.dart';
import 'package:rokeapp/widgets/highlight.widget.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});
  static String routeName = "/landingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070B1D),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "ORGANIZAMOS TU TRABAJO",
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                'assets/landing2.svg',
                height: MediaQuery.sizeOf(context).width * .6,
              )
            ],
          ),
          Highlight(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Y LO COMPLETAMOS MEJOR",
                style: TextStyle(color: Colors.white, fontSize: 18),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        LoginScreen.routeName, (route) => false);
                  },
                  child: SvgPicture.asset('assets/nextBtn.svg'))
            ],
          ),
        ],
      )),
    );
  }
}
