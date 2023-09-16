import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../order/order.dart';
import '../provider/my_provider.dart';

class CartPage extends StatelessWidget {
  Widget cartItem({
    required String image,
    required String name,
    required int price,
    required VoidCallback onTap,
    required int quantity,
  }) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
            ),
            child: Container(
              width: 160,
              height: 160,
              child: CircleAvatar(
                backgroundImage: NetworkImage(image),
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    // Text(
                    //   "burger bhout acha hain",
                    //   style: TextStyle(color: Colors.white),
                    // ),
                    Text(
                      "Price \$ $price",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Text(
                          'Quantity $quantity',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        )
                      ],
                    )
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete, color: Colors.white),
                onPressed: onTap,
              )
            ],
          )),
        ],
      ),
    );
  }

  Widget build(BuildContext context) {
    MyProvider provider = Provider.of<MyProvider>(context);
    int total = provider.totalprice();
    return Scaffold(
      backgroundColor: Color(0xff3a3e3e),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 65,
        decoration: BoxDecoration(
            color: Color(0xff3a3e3e), borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "\$ $total",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PlaceOrder()));
                },
                child: Text(
                  "Buy Now",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: const Color(0xff3a3e3e),
      ),
      body: ListView.builder(
        itemCount: provider.cartList.length,
        itemBuilder: (ctx, index) {
          provider.getdeleteIndex(index);
          return cartItem(
            onTap: () {
              provider.delete();
            },
            image: provider.cartList[index].image,
            name: provider.cartList[index].name,
            price: provider.cartList[index].price,
            quantity: provider.cartList[index].quantity,
          );
        },
      ),
    );
  }
}
