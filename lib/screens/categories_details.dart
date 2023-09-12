// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/screens/home.dart';

import '../models/food_categories_model.dart';
import '../widgets/my_container.dart';
class CategoriesDetails extends StatelessWidget {
  List<FoodCategoriesModel>list=[];
   CategoriesDetails({Key? key,required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff2b2b2b),
          leading: IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const Homescreen()));
          }, icon: const Icon(Icons.arrow_back,color: Colors.white,)),
        ),
          backgroundColor: const Color(0xff2b2b2b),
        body: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
          shrinkWrap: false,
          primary: false,
          children: list.map((e) =>
              MyContainer(
                ontap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>DetailScreen(
                    image: e.image,
                    name:e.name,
                    price: e.price,


                  )));
                },
                  image: e.image, price: e.price, name: e.name)).toList(),
        ),
      ),
    );
  }
}
