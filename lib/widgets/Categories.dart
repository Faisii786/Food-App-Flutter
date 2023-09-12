import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  final String image;
  final VoidCallback ontap;
  final String name;
   const Categories({Key? key,required this.image,required this.name,required this.ontap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20),
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage(image),fit: BoxFit.cover),
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10,),
          Text(name,
            style: const TextStyle(
              color: Colors.white,
            ),)
        ],
      ),
    );
  }
}
