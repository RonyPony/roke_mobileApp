import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RokeMainBtn extends StatelessWidget {
  final String text;
  final double width;
  final double? textSize;
  final Color color;
  final bool? enabled;
  final bool? showNextIcon;
  final Color fontColor;
  const RokeMainBtn(
      {super.key,
      required this.text,
      this.width = 300,
      this.color = const Color(0xff00867E),
      this.fontColor = Colors.white,
      this.enabled,
      this.showNextIcon = true,
      this.textSize = 28});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
        width: width,
        padding: const EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(50)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              text.toUpperCase(),
              style: TextStyle(
                  color: fontColor,
                  fontSize: textSize,
                  fontWeight: FontWeight.bold),
            ),
            showNextIcon!
                ? const SizedBox(
                    width: 20,
                  )
                : const SizedBox(),
            showNextIcon!
                ? Container(
                    child: SvgPicture.asset("assets/NEXTBTN2.svg",
                        height: 28, color: fontColor))
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}
