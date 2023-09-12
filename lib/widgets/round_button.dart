// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
class RoundButton extends StatelessWidget {
  String title;
  bool loading;
  final VoidCallback ontap;
   RoundButton({Key? key,
     required this.ontap,
     required this.title,
     this.loading=false,
   }) : super(key: key);
  Color buttoncolor=const Color(0xFFBCD438);
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: ontap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color:  buttoncolor,
        ),
        child: Center(child: loading? const CircularProgressIndicator(strokeWidth: 3,color: Colors.black):
        Text(title,style:  const TextStyle(color: Colors.black,fontSize: 25,fontFamily: 'MyFont1'),))
      ),
    );
  }
}
