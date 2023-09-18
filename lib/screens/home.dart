import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/fetch%20data/my_provider.dart';
import 'package:food_app/screens/categories_details.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/credentials/login_screen.dart';
import 'package:food_app/widgets/Categories.dart';
import 'package:food_app/widgets/my_container.dart';
import 'package:provider/provider.dart';
import '../models/categories_model.dart';
import '../models/sub_categories_model.dart';
// import '../slider/carousal_slider.dart';
import 'cart.dart';
// import 'package:carousel_slider/carousel_controller.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  // for carousal slider
  final urlImages = [
    'https://images.unsplash.com/photo-1513104890138-7c749659a591?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1586816001966-79b736744398?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://plus.unsplash.com/premium_photo-1694141252026-3df1de888a21?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80',
    'https://images.unsplash.com/photo-1504754524776-8f4f37790ca0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
    'https://images.unsplash.com/photo-1563379926898-05f4575a45d8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
  ];

  int activeIndex = 0;
  final CarouselController carouselController = CarouselController();

  // Widget buildIndicator() => AnimatedSmoothIndicator(
  //       onDotClicked: animateToSlide,
  //       effect: const ExpandingDotsEffect(
  //           dotWidth: 15, activeDotColor: Colors.blue),
  //       activeIndex: activeIndex,
  //       count: urlImages.length,
  //     );

  // void animateToSlide(int index) => carouselController.animateToPage(index);

  final auth = FirebaseAuth.instance;
  List<CategoriesModel> burger = [];
  List<CategoriesModel> recipe = [];
  List<CategoriesModel> bbq = [];
  List<CategoriesModel> biryanil = [];
  List<CategoriesModel> karahi = [];
  List<FoodModel> foodlist = [];
  List<FoodCategoriesModel> burgerCategories = [];
  List<FoodCategoriesModel> recipeCategories = [];
  List<FoodCategoriesModel> bbqCategories = [];
  List<FoodCategoriesModel> biryaniCategories = [];
  List<FoodCategoriesModel> karahiCategories = [];

  // for searching purpose
  TextEditingController searchController = TextEditingController();

  Widget recipes() {
    return Row(
      children: recipe
          .map((e) => Categories(
              ontap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoriesDetails(list: recipeCategories)));
              },
              image: e.image,
              name: e.name))
          .toList(),
    );
  }

  Widget burgers() {
    return Row(
        children: burger
            .map((e) => Categories(
                ontap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CategoriesDetails(
                        list: burgerCategories,
                      ),
                    ),
                  );
                },
                image: e.image,
                name: e.name))
            .toList());
  }

  Widget bBQS() {
    return Row(
      children: bbq
          .map((e) => Categories(
              ontap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoriesDetails(list: bbqCategories)));
              },
              name: e.name,
              image: e.image))
          .toList(),
    );
  }

  Widget biryani() {
    return Row(
      children: biryanil
          .map((e) => Categories(
              ontap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoriesDetails(list: biryaniCategories)));
              },
              image: e.image,
              name: e.name))
          .toList(),
    );
  }

  Widget chicken() {
    return Row(
      children: karahi
          .map((e) => Categories(
              ontap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CategoriesDetails(list: karahiCategories)));
              },
              image: e.image,
              name: e.name))
          .toList(),
    );
  }

  //Function to filter food list based on search input
  List<FoodModel> filteredFoodList = [];

  void filterFoodList(String query) {
    setState(() {
      filteredFoodList = foodlist.where((food) {
        return food.name.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    void alertlogoutbox() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: const Color(0xff3a3e3e),
            elevation: 10,
            title: const Text(
              'Sign out',
              style: TextStyle(color: Colors.white),
            ),
            content: const Text(
              "Are you sure you want to Sign out ?",
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                child: const Text('No', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Yes', style: TextStyle(color: Colors.white)),
                onPressed: () {
                  auth.signOut().then((value) => Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const LoginScreen())));
                },
              ),
            ],
          );
        },
      );
    }

    MyProvider provider = Provider.of<MyProvider>(context);
    //burger list
    provider.getBurgerCategories();
    // burger=provider.burgerList;
    burger = provider.throwburgerlist;
    //Recipe
    provider.getRecipes();
    recipe = provider.throwrecipeList;
    // recipe=provider.recipeList;
    //bbq
    provider.getbbqCategories();
    // bbq=provider.bbqList;
    bbq = provider.throwbbqList;
    //biryani
    provider.getBiryaniCategories();
    // burger=provider.biryaniList;
    biryanil = provider.throwbiryanilist;
    //karahi
    provider.getkarahi();
    // karahi=provider.karahiList;
    karahi = provider.throwkarahiList;

    //hjkjkll//
    provider.getFoodList();
    foodlist = provider.throwFoodList;
    provider.getBurgerCategoriesList();
    burgerCategories = provider.throwburgerCategoriesList;

    ///recipecategories here///
    provider.getRecipeCategoriesList();
    recipeCategories = provider.throwRecipeCatList;

    ///bbq categories list////
    provider.getBBQCategoriesList();
    bbqCategories = provider.throwBBQCatList;

    ///biryani categories List///
    provider.getBiryaniCategoriesList();
    biryaniCategories = provider.throwBiryaniCatList;
    
    ///karahi Categories///
    provider.getKarahiCategoriesList();
    karahiCategories = provider.throwKarahiCatList;
    //GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

    // get user data from firestore for drawer
    Future<Map<String, dynamic>> getUserData() async {
      final user = auth.currentUser;
      if (user != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('userData')
            .doc(user.uid)
            .get();
        return userDoc.data() as Map<String, dynamic>;
      }
      return {};
    }

    Widget buildImage(String urlImage, int index) => Image.network(
          urlImage, /*fit: BoxFit.contain*/
        );
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: const Color(0xff2b2b2b),
          drawer: Drawer(
            backgroundColor: const Color(0xff2b2b2b),
            child: FutureBuilder<Map<String, dynamic>>(
              future: getUserData(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Error');
                } else if (!snapshot.hasData || snapshot.data == null) {
                  return const Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                    strokeWidth: 3,
                  ));
                } else {
                  final userData = snapshot.data;
                  return Column(
                    children: [
                      UserAccountsDrawerHeader(
                        accountName: Text(
                          userData?['firstName'] ?? 'Unknown',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20),
                        ),
                        accountEmail: Text(
                          userData?['email'] ?? 'no email',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 15),
                        ),
                        currentAccountPicture: Image.asset(
                          'assets/images/food.png',
                          color: Colors.white,
                        ),
                        decoration: const BoxDecoration(
                          color: Color(0xff2b2b2b),
                        ),
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        leading: const Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Home",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Profile",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      const ListTile(
                        leading: Icon(
                          Icons.shop_2,
                          color: Colors.white,
                        ),
                        title: Text(
                          "Order",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CartPage()));
                          // provider.addToCart(
                          //     image: widget.image,
                          //     quantity: quantity,
                          //     price: widget.price,
                          //     name: widget.name);
                        },
                        leading: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Cart",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const Divider(
                        height: 10,
                      ),
                      ListTile(
                        onTap: () {
                          alertlogoutbox();
                          // auth.signOut().then((value) => Navigator.of(context).push(
                          //     MaterialPageRoute(
                          //         builder: (context) => const LoginScreen())));
                        },
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.white,
                        ),
                        title: const Text(
                          "Logout",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  );
                }
              },
            ),
          ),
          appBar: AppBar(
            title: const Text(
              'Food Zone',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xff2b2b2b),
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              PopupMenuButton(
                  color: const Color.fromARGB(255, 20, 1, 53),
                  icon: const Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                  itemBuilder: (context) {
                    return [
                      const PopupMenuItem(
                        value: 0,
                        child: Text(
                          "My Account",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 1,
                        child: Text(
                          "Settings",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      PopupMenuItem(
                        value: 2,
                        child: InkWell(
                            onTap: () {
                              alertlogoutbox();
                            },
                            child: const Text(
                              "Logout",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ];
                  },
                  onSelected: (value) {
                    if (value == 0) {
                    } else if (value == 1) {
                    } else if (value == 2) {}
                  }),
              // CircleAvatar(
              //   backgroundImage: AssetImage('images/food.png'),
              // ),
              // IconButton(
              //   onPressed: () {
              //     alertlogoutbox();
              //   },
              //   //icon: const Icon(Icons.logout),
              //   icon: Text(
              //     "Logout",
              //     style: GoogleFonts.alkatra(color: Colors.white),
              //   ),
              // ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                // const SizedBox(height: 12),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    controller: searchController, // Step 1
                    onChanged: filterFoodList, // Step 2
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      filled: true,
                      fillColor: const Color(0xff3a3e3e),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),

                // buildIndicator(),
                //CarousalSlider(),
                const SizedBox(
                  height: 0,
                ),
                CarouselSlider.builder(
                    carouselController: carouselController,
                    itemCount: urlImages.length,
                    itemBuilder: (context, index, realIndex) {
                      final urlImage = urlImages[index];
                      return buildImage(urlImage, index);
                    },
                    options: CarouselOptions(
                        height: 230,
                        autoPlay: true,
                        enableInfiniteScroll: false,
                        autoPlayAnimationDuration: const Duration(seconds: 3),
                        enlargeCenterPage: true,
                        onPageChanged: (index, reason) =>
                            setState(() => activeIndex = index))),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        burgers(),
                        recipes(),
                        bBQS(),
                        biryani(),
                        chicken(),
                      ],
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: SizedBox(
                    height: 505,
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: 0.8,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      shrinkWrap: false,
                      primary: false,
                      children: filteredFoodList.isNotEmpty
                          ? filteredFoodList
                              .map((e) => MyContainer(
                                    image: e.image,
                                    price: e.price,
                                    name: e.name,
                                    ontap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    name: e.name,
                                                    price: e.price,
                                                    image: e.image,
                                                  )));
                                    },
                                  ))
                              .toList()
                          : foodlist // Show all items when search is empty
                              .map((e) => MyContainer(
                                    image: e.image,
                                    price: e.price,
                                    name: e.name,
                                    ontap: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                    name: e.name,
                                                    price: e.price,
                                                    image: e.image,
                                                  )));
                                    },
                                  ))
                              .toList(),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
