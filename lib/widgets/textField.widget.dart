import 'package:flutter/material.dart';

class RokeTextField extends StatelessWidget {
  final String placeHolder;
  final TextEditingController? receivedController;
  final TextInputType? keyboardType;
  final bool? isPassword;
  final void Function()? onTap;
  final void Function()? onChanged;
  final double? widthAdjustment;
  final int? maxline;
  final bool? isLongText;

  const RokeTextField(
      {super.key,
      required this.placeHolder,
      this.onTap,
      this.onChanged,
      this.receivedController,
      this.keyboardType = TextInputType.name,
      this.widthAdjustment = .78,
      this.maxline = 1,
      this.isLongText = false,
      this.isPassword = false});

  @override
  Widget build(BuildContext context) {
    Size baseSize = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => onTap!(),
      child: Container(
        height: 80,
        width: baseSize.width * widthAdjustment!,
        decoration: const BoxDecoration(),
        child: TextField(
          keyboardType: keyboardType,
          controller: receivedController,
          maxLines: maxline,
          obscureText: isPassword!,
          onChanged: (value) {
            if (onChanged != null) {
              onChanged!();
            }
          },
          decoration: InputDecoration(
              // contentPadding: isLongText!
              //     ? EdgeInsets.only(left: 20, bottom: 100, top: 100)
              //     : EdgeInsets.only(top: 20, left: 10, bottom: 20),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(15),
              ),
              labelText: placeHolder.toUpperCase(),
              labelStyle:
                  const TextStyle(color: Color(0xffBFBFBF), fontSize: 22),
              fillColor: Color(0xff959595),
              filled: true),
        ),
      ),
    );
  }
}
