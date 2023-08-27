import 'package:flutter/material.dart';

class RokeButton extends StatelessWidget {
  const RokeButton({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width * .2;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: 10),
      decoration: BoxDecoration(
          color: Color(0xff008A82), borderRadius: BorderRadius.circular(20)),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(fontSize: 23, color: Colors.white),
      ),
    );
  }
}
