import 'package:flutter/material.dart';

Widget buildLogin(
    BuildContext context, {
      Function()? onTap,
      String img = "",
      String text = "",
      double width = 0,
      double height = 0,
    }) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5, left: 10, right: 10),
    child: GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          border: Border.all(
            color: const Color(0xffD3D3D3),
            width: 1.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(img),
            const SizedBox(width: 15),
            Text(
              text,
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
      ),
    ),
  );
}