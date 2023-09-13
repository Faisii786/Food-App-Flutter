import'package:flutter/material.dart';
class MyTextField extends StatelessWidget {
  final String hintText;
  final bool obsecureText;
  final prefixIcon;
  final TextEditingController controller;
  const MyTextField({Key? key,required this.hintText,this.obsecureText=true,required this.controller,required this.prefixIcon,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color(0xFFBCD438),
      obscureText: obsecureText,
      controller: controller,
      decoration:  InputDecoration(
       prefixIcon: prefixIcon,
        border: OutlineInputBorder(
          borderSide:const  BorderSide(
            style: BorderStyle.solid
          ),
          borderRadius: BorderRadius.circular(12)

        ),

        hintText: hintText,

      ),
    );
  }
}
