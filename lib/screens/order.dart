// ignore_for_file: unnecessary_null_comparison

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/screens/ordersucessfullpage.dart';
import 'package:food_app/widgets/my_textfield.dart';
import 'package:food_app/widgets/round_button.dart';
import 'package:google_fonts/google_fonts.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);
  // static Pattern pattern =
  //     r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  //RegExp reg = RegExp(placeOrder.pattern.toString());
  Color whatsappBusinessColor = const Color(0xFF0b2d39);
  Color buttoncolor = const Color(0xFFBCD438);
  final namecontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final citycontroller = TextEditingController();
  final adresscontroller = TextEditingController();
  final emailController = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool loading = false;
  GlobalKey<ScaffoldMessengerState> globalkey =
      GlobalKey<ScaffoldMessengerState>();
  void validation1() {
    if (namecontroller.text.trim().isEmpty || namecontroller.text == null) {
      showSnackbar('Name is required');
      return;
    }
    if (phonecontroller.text.trim().isEmpty || phonecontroller.text == null) {
      showSnackbar('Phone number is required');
      return;
    }
    if (citycontroller.text.trim().isEmpty || citycontroller.text == null) {
      showSnackbar('City is required');
      return;
    }
    if (adresscontroller.text.trim().isEmpty || adresscontroller.text == null) {
      showSnackbar('Adress is required');
      return;
    }
    // if (emailController.text.trim().isEmpty || emailController.text == null) {
    //   showSnackbar('Email is empty');
    //   return;
    // } else if (!reg.hasMatch(emailController.text)) {
    //   showSnackbar('Please enter valid email');
    //   return;
    // }
    else {
      setState(() {
        loading = true;
      });
      String username = namecontroller.text;
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => OrderSucessfull(username)));
    }
  }

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    phonecontroller.dispose();
    citycontroller.dispose();
    adresscontroller.dispose();
  }

  // Future login() async {
  //   setState(() {
  //     loading = true;
  //   });
  //   try {
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: emailController.text)
  //         .then((value) {
  //       String username = namecontroller.text;
  //       Navigator.push(context,
  //           MaterialPageRoute(builder: (context) => OrderSucessfull(username)));
  //     });
  //   } on FirebaseAuthException catch (e) {
  //     if (e.code == 'user-not-found') {
  //       showSnackbar('Please use registered email');
  //       setState(() {
  //         loading = false;
  //       });
  //       return;
  //     }
  //   } catch (e) {
  //     showSnackbar(e.toString());
  //     setState(() {
  //       loading = false;
  //     });
  //   }
  //   setState(() {
  //     loading = false;
  //   });
  // }

  void showSnackbar(String message) {
    final snackbar = SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 3),
    );
    globalkey.currentState?.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldMessenger(
      key: globalkey,
      child: Scaffold(
        backgroundColor: whatsappBusinessColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Place order',
                      style:
                          GoogleFonts.aladin(color: Colors.white, fontSize: 26),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Enter you valid Credentials',
                      style: GoogleFonts.aladin(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Expanded(
                  child: Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Column(
                          children: [
                            MyTextField(
                              hintText: 'Enter your name',
                              controller: namecontroller,
                              obsecureText: false,
                              prefixIcon: const Icon(Icons.person),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              hintText: 'Enter phone num',
                              controller: phonecontroller,
                              obsecureText: false,
                              prefixIcon: const Icon(Icons.call),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              prefixIcon: const Icon(Icons.location_city),
                              hintText: 'Enter your City',
                              controller: citycontroller,
                              obsecureText: false,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            MyTextField(
                              prefixIcon: const Icon(Icons.location_city),
                              hintText: 'Enter full Adress',
                              controller: adresscontroller,
                              obsecureText: false,
                            ),
                            // const SizedBox(
                            //   height: 20,
                            // ),
                            // MyTextField(
                            //   prefixIcon: const Icon(Icons.email),
                            //   hintText: 'Enter your Email',
                            //   controller: emailController,
                            //   obsecureText: false,
                            // ),
                            const SizedBox(
                              height: 20,
                            ),
                            RoundButton(
                              title: 'Buy Now',
                              loading: loading,
                              ontap: () {
                                validation1();
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}

// // ignore_for_file: override_on_non_overriding_member

//  import 'package:flutter/material.dart';
// import 'package:food_app/screens/home.dart';
// import 'package:provider/provider.dart';

// import '../provider/my_provider.dart';

// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget cartItem({
//     required String image,
//     required String name,
//     required int price,
//     required VoidCallback onTap,
//     required int quantity,
//   }) {
//     return Row(
//       children: [
//         SizedBox(
//           width: 170,
//           height: 170,
//           child: CircleAvatar(
//             backgroundImage: NetworkImage(image),
//           ),
//         ),
//         const SizedBox(
//           width: 20,
//         ),
//         Expanded(
//             child: Stack(
//               alignment: Alignment.topRight,
//               children: [
//                 SizedBox(
//                   height: 200,
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         name,
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 30,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       const Text(
//                         "burger bhout acha hain",
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       Text(
//                         "\$ $price",
//                         style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Row(
//                         children: [
//                           Text(
//                             "$quantity",
//                             style: const TextStyle(fontSize: 20, color: Colors.white),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//                 IconButton(
//                   icon: const Icon(Icons.close, color: Colors.white),
//                   onPressed: onTap,
//                 )
//               ],
//             )),
//       ],
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     MyProvider provider = Provider.of<MyProvider>(context);
//     int total = provider.totalprice();
//     return Scaffold(
//       backgroundColor: const Color(0xff3a3e3e),
//       bottomNavigationBar: Container(
//         margin: const EdgeInsets.only(bottom: 20, left: 20, right: 20),
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         height: 65,
//         decoration: BoxDecoration(
//             color: const Color(0xff3a3e3e), borderRadius: BorderRadius.circular(10)),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               "\$ $total",
//               style: const TextStyle(color: Colors.white, fontSize: 30),
//             ),
//             const Text(
//               "Check Out",
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 25,
//                   fontWeight: FontWeight.bold),
//             )
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         backgroundColor: const Color(0xff3a3e3e),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back,color: Colors.white,),
//           onPressed: () {
//             Navigator.of(context).pushReplacement(
//               MaterialPageRoute(
//                 builder: (context) => const Homescreen(),
//               ),
//             );
//           },
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: provider.cartList.length,
//         itemBuilder: (ctx, index) {
//           provider.getdeleteIndex(index);
//           return cartItem(
//             onTap: (){
//               provider.delete();
//             },
//             image: provider.cartList[index].image,
//             name: provider.cartList[index].name,
//             price: provider.cartList[index].price,
//             quantity: provider.cartList[index].quantity,
//           );
//         },
//       ),
//     );
//   }
// }
