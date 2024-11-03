import 'package:flutter/material.dart';

Widget buildMainButton({
  Function()? onPressed,
  Color backgroudColor = Colors.white,
  double height = 0,
  double width = 0,
  double radius = 0,
  String text = "",
  Color textColor = Colors.white,
  double fontSize = 0,
  FontWeight? fontWeight,
  Color borderColor = Colors.black,
  IconData? icon,
  Color iconColor = Colors.black,
  bool isHaveIcon = false,
}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroudColor,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
            side: BorderSide(
              color: borderColor,
              width: 1,
            ),
          )),
      child: (isHaveIcon == false)
          ? Text(
              text,
              style: TextStyle(
                color: textColor,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
            )
          : SizedBox(
              height: height,
              width: width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: iconColor,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                    ),
                  )
                ],
              ),
            ));
}
