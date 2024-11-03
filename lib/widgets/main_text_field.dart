import 'package:flutter/material.dart';

Widget buildTextField({
  String hintText = "",
  bool isPass = false,
  IconData iconLead = Icons.abc,
  Widget? suffixIcon,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: TextField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Color(0xffD3D3D3),
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.only(top: 35),
        prefixIcon: Icon(iconLead),
        suffixIcon: suffixIcon,
      ),
      obscureText: isPass,
    ),
  );
}
