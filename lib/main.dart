import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:rokeapp/provider/auth.provider.dart';
import 'package:rokeapp/provider/ticket.provider.dart';
import 'package:rokeapp/routes/routes.dart';
import 'package:rokeapp/screen/landing/landing.screen.dart';
import 'package:rokeapp/services/auth.service.dart';
import 'package:rokeapp/services/ticket.service.dart';
import 'package:rokeapp/widgets/highlight.widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AuthProvider(AuthService()),
        ),
        ChangeNotifierProvider(
          create: (context) => TicketProvider(TicketService()),
        ),
      ],
      child: MaterialApp(
        routes: getApplicationRoutes(),
        home: const MyHomePage(),
      ),
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
      backgroundColor: const Color(0xFF070B1D),
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Padding(
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
                  const SizedBox(
                    width: 30,
                  ),
                  const Text(
                    'EN UN SOLO LUGAR',
                    style: TextStyle(color: Colors.white, fontSize: 10),
                  ),
                ],
              ),
              SvgPicture.asset(
                'assets/landing1.svg',
                height: MediaQuery.sizeOf(context).width * .6,
              ),
              const Highlight(),
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
