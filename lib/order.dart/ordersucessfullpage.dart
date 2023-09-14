import 'package:flutter/material.dart';
import 'package:food_app/screens/home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:food_app/widgets/round_button.dart';

class OrderSucessfull extends StatelessWidget {
  final String customername;
  final int phone;
  final String city;
  final String adress;

  OrderSucessfull(this.customername, this.phone, this.city, this.adress);

  @override
  Widget build(BuildContext context) {
    Color whatsappBusinessColor = const Color(0xFF0b2d39);
    return Scaffold(
      backgroundColor: whatsappBusinessColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
                width: 300,
                child: Text(
                    'We are thrilled to inform you that your order has been successfully placed and is now in our system. Thank you for choosing Food App for your purchase.If you have any questions, concerns, or need further assistance, please do not hesitate to contact our customer support team at.Our dedicated staff is here to help you with any inquiries you may have.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order Detail',
                  style: const TextStyle(
                      fontSize: 20, color: Colors.white, fontFamily: 'MyFont2'),
                ),
                Text('Order ID : 01',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                Text('Name : $customername',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                Text('Phone : $phone',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                Text('City : $city',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
                Text('Adress : $adress',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.taviraj(
                      fontSize: 18,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Homescreen()));
              },
              child: Text("Go to Home Screen"))
        ],
      ),
    );
  }
}
