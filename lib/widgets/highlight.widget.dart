import 'package:flutter/material.dart';

class Highlight extends StatelessWidget {
  const Highlight({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              );
  }
}