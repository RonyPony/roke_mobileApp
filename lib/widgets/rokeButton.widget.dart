import 'package:flutter/material.dart';

class RokeButton extends StatelessWidget {
  const RokeButton(
      {super.key, required this.text, this.currentFontSize = 23, this.icon});
  final String text;
  final Widget? icon;
  final double? currentFontSize;

  @override
  Widget build(BuildContext context) {
    double size = MediaQuery.sizeOf(context).width * .1;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size, vertical: 10),
      decoration: BoxDecoration(
          color: const Color(0xff008A82),
          borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon ?? SizedBox(),
          Text(
            text.toUpperCase(),
            style: TextStyle(fontSize: currentFontSize!, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
