import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomMenu extends StatelessWidget {
  const BottomMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.grey.withOpacity(.4)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/home.svg'),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 4,
          ),
          SvgPicture.asset('assets/stats2.svg'),
          SizedBox(
            width: MediaQuery.sizeOf(context).width / 4,
          ),
          SvgPicture.asset('assets/user.svg')
        ],
      ),
    );
  }
}
