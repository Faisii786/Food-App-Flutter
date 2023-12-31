import 'package:flutter/material.dart';
import 'package:food_app/fetch%20data/my_provider.dart';
import 'package:food_app/screens/cart.dart';
import 'package:food_app/screens/home.dart';
import 'package:provider/provider.dart';

import '../widgets/round_button.dart';

class DetailScreen extends StatefulWidget {
  final String name;
  final String image;
  final int price;
  const DetailScreen(
      {Key? key, required this.price, required this.name, required this.image})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2b2b2b),
        appBar: AppBar(
          backgroundColor: const Color(0xff2b2b2b),
          leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Homescreen()));
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(
              width: 300,
              image: NetworkImage(widget.image),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                //flex: 1,
                child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color(0xff3a3e3e),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      widget.name,
                      style: const TextStyle(color: Colors.white, fontSize: 25),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if (quantity > 0) {
                                    quantity--;
                                  }
                                });
                              },
                              child: Container(
                                height: 39,
                                width: 39,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(Icons.remove),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              quantity.toString(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  quantity++;
                                });
                              },
                              child: Container(
                                height: 39,
                                width: 39,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          '\$${widget.price * quantity}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 30),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Description',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                    const Text(
                      "We take pride in delivering exceptional food service that tantalizes your taste buds with a blend of flavors, quality ingredients, and a dash of culinary expertise.",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    RoundButton(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()));
                          provider.addToCart(
                              image: widget.image,
                              quantity: quantity,
                              price: widget.price,
                              name: widget.name);
                        },
                        title: 'Add To Cart')
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
