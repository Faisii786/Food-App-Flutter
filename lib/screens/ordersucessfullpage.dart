import 'package:flutter/material.dart';

class OrderSucessfull extends StatelessWidget {
  final String customername;
  OrderSucessfull(this.customername);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Text('Dear $customername',style: const TextStyle(fontSize: 25,color: Colors.black),),
          const Text(
              'We are thrilled to inform you that your order has been successfully placed and is now in our system. Thank you for choosing Food App for your purchase'),
          const Text(
              'If you have any questions, concerns, or need further assistance, please do not hesitate to contact our customer support team at [Customer Support Email/Phone Number]. Our dedicated staff is here to help you with any inquiries you may have.'),
        ],
      ),
    );
  }
}
