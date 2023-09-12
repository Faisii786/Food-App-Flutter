import 'package:flutter/material.dart';
class MyPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  const MyPasswordTextField({Key? key,required this.controller}) : super(key: key);

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
var obsercureText=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: obsercureText,
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'enter your password',
          suffixIcon: GestureDetector(
            onTap: (){
              setState(() {
                obsercureText=!obsercureText;
              });
            },
              child:obsercureText? const Icon(Icons.visibility_off,color: Color(0xFFBCD438),)
        :const Icon(Icons.visibility,color: Color(0xFFBCD438),),
        ),

      ),
    );
  }
}
