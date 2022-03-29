import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  String? text = "AddText";
  IconData? icon;
  final Color color;
  final Color backgroundColor;
  final Color borderColor;
  double size;
  bool? isIcon;
  AppButton(
      {Key? key,
      this.isIcon = false,
      this.text,
      this.icon,
      required this.size,
      required this.color,
      required this.backgroundColor,
      required this.borderColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1.0,
          ),
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10)),
      child: Center(
        child: isIcon == false
            ? Text(
                text!,
                style: TextStyle(
                    color: color,
                    fontSize: 10,
                    fontFamily: "Janna",
                    fontWeight: FontWeight.bold),
              )
            : Icon(
                icon,
                color: color,
              ),
      ),
    );
  }
}
