// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  String image;
  String name;
  int price;
  final VoidCallback ontap;
  MyContainer(
      {Key? key,
      required this.image,
      required this.price,
      required this.name,
      required this.ontap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 220,
        width: 200,
        decoration: BoxDecoration(
          color: const Color(0xff3a3e3e),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            SizedBox(
              height: 13,
            ),
            CircleAvatar(
              backgroundImage: NetworkImage(image),
              radius: 50,
            ),
            ListTile(
              leading: Text(
                name,
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
              trailing: Text(
                "\$ $price",
                style: const TextStyle(color: Colors.white, fontSize: 15),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.star,
                    color: Colors.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
