import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OrderSucessfull extends StatelessWidget {
  final String customername;
  OrderSucessfull(this.customername);

  @override
  Widget build(BuildContext context) {
    Color whatsappBusinessColor = const Color(0xFF0b2d39);
    return Scaffold(
      backgroundColor: whatsappBusinessColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: whatsappBusinessColor,
      ),
      body: Column(
        children: [
          Text(
            'Dear $customername',
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontFamily: 'MyFont2'),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Container(
                child: Text(
                    'We are thrilled to inform you that your order has been successfully placed and is now in our system. Thank you for choosing Food App for your purchase',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Container(
                child: Text(
                    'If you have any questions, concerns, or need further assistance, please do not hesitate to contact our customer support team at [Sobannaseem4@gmail.com]. Our dedicated staff is here to help you with any inquiries you may have.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
