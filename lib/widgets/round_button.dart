// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RoundButton extends StatelessWidget {
  String title;
  bool loading;
  final VoidCallback ontap;
  RoundButton({
    Key? key,
    required this.ontap,
    required this.title,
    this.loading = false,
  }) : super(key: key);
  Color buttoncolor = const Color(0xFFBCD438);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 51, 11, 121),
          ),
          child: Center(
              child: loading
                  ? const CircularProgressIndicator(
                      strokeWidth: 3, color: Colors.white)
                  : Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        title,
                        style: GoogleFonts.stylish(
                            color: Colors.white, fontSize: 25),
                      ),
                    ))),
    );
  }
}
