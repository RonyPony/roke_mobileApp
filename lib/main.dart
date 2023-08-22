import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
                height: 250,
              ),
              Container(
                height: 50,
                width: MediaQuery.sizeOf(context).width * .95,
                decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xff00FFF0),
                        Colors.transparent,
                        Colors.transparent
                        // Color(0xff00FFF0).withOpacity(0),
                      ],
                    ),
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(40)),
              ),
              SvgPicture.asset('assets/nextBtn.svg')
            ],
          ),
        ),
      ),
    );
  }
}
