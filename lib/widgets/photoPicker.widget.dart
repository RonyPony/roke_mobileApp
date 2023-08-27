import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PhotoPicker extends StatelessWidget {
  const PhotoPicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Color(0xff959595)),
          child: Text("TOMAR FOTO AL EQUIPO"),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(color: Color(0xff959595)),
          child: SvgPicture.asset("assets/"),
        ),
      ],
    );
  }
}
