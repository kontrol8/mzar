import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  final String? text;
  ResponsiveButton({Key? key, this.width, this.isResponsive = false, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: 45,
      decoration: BoxDecoration(
        color: Color.fromRGBO(150, 126, 80, 5),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          if (isResponsive == true)
            Text(
              text!,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: "janna",
              ),
            )
          else
            Text(''),
          Image(
            image: AssetImage("assets/images/button.png"),
          ),
        ],
      ),
    );
  }
}
