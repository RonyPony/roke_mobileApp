import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhotoPicker extends StatelessWidget {
  const PhotoPicker(
      {super.key,
      this.spaceBetweenFields = 8,
      this.placeholder = "TOMAR FOTO AL EQUIPO",
      this.buttonWidth = 30});
  final double? spaceBetweenFields;
  final String? placeholder;
  final double? buttonWidth;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: buttonWidth!, vertical: 15),
          decoration: BoxDecoration(
              color: Color(0xff959595),
              borderRadius: BorderRadius.circular(20)),
          child: Text(
            placeholder!.toUpperCase(),
            style: TextStyle(color: Color(0xffBFBFBF)),
          ),
        ),
        SizedBox(
          width: spaceBetweenFields,
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
              color: Color(0xff959595),
              borderRadius: BorderRadius.circular(20)),
          child: SvgPicture.asset("assets/photo.svg"),
        ),
      ],
    );
  }
}
