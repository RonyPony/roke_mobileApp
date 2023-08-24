import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rokeapp/routes/routes.dart';
import 'package:rokeapp/screen/landing/landing.screen.dart';
import 'package:rokeapp/widgets/highlight.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: getApplicationRoutes(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070B1D),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(bottom: 10, top: 30),
                child: Text(
                  'TODO LO QUE NECESITAS',
                  style: TextStyle(fontSize: 28, color: Colors.white),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    'assets/arrow1.svg',
                    height: 100,
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'EN UN SOLO LUGAR',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/landing1.svg',
                height: MediaQuery.sizeOf(context).width * .6,
              ),
              Highlight(),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed(LandingPage.routeName);
                  },
                  child: SvgPicture.asset('assets/nextBtn.svg'))
            ],
          ),
        ),
      ),
    );
  }
}
