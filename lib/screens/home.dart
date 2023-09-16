import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_app/models/food_model.dart';
import 'package:food_app/provider/my_provider.dart';
import 'package:food_app/slider/carousal_slider.dart';
import 'package:food_app/screens/categories_details.dart';
import 'package:food_app/screens/detail_screen.dart';
import 'package:food_app/credentials/login_screen.dart';
import 'package:food_app/widgets/Categories.dart';
import 'package:food_app/widgets/my_container.dart';
import 'package:provider/provider.dart';
import '../models/categories_model.dart';
import '../models/food_categories_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({
    Key? key,
  }) : super(key: key);
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  List<CategoriesModel> Burger = [];
  final auth = FirebaseAuth.instance;
  List<CategoriesModel> Recipe = [];
  List<CategoriesModel> bbq = [];
  List<CategoriesModel> biryanil = [];
  List<CategoriesModel> karahi = [];
  List<FoodModel> foodlist = [];
  List<FoodCategoriesModel> burgerCategories = [];
  List<FoodCategoriesModel> recipeCategories = [];
  List<FoodCategoriesModel> bbqCategories = [];
  List<FoodCategoriesModel> biryaniCategories = [];
  List<FoodCategoriesModel> karahiCategories = [];
  Widget recipes() {
    return Row(
      children: Recipe.map((e) => Categories(
          ontap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        CategoriesDetails(list: recipeCategories)));
          },
          image: e.image,
          name: e.name)).toList(),
    );
  }

  Widget Burgers() {
    return Row(
        children: Burger.map((e) => Categories(
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
            name: e.name)).toList());
  }

  Widget BBQS() {
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

  Widget Biryani() {
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

  Widget Chicken() {
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
    Burger = provider.throwburgerlist;
    //Recipe
    provider.getRecipes();
    Recipe = provider.throwrecipeList;
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
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
          backgroundColor: const Color(0xff2b2b2b),
          drawer: Drawer(
            child: Container(
              color: const Color(0xff2b2b2b),
              child: Column(
                children: [
                  const DrawerHeader(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image(
                            width: 50,
                            color: Colors.white,
                            image: AssetImage(
                              'assets/images/food.png',
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Faisal Aslam',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          'Faisalaslam218@gmail.com',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ],
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
                              builder: (context) => CarousalSlider()));
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
              ),
            ),
          ),
          appBar: AppBar(
            title: const Text(
              'Food App',
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            centerTitle: true,
            elevation: 0.0,
            backgroundColor: const Color(0xff2b2b2b),
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              // CircleAvatar(
              //   backgroundImage: AssetImage('images/food.png'),
              // ),
              IconButton(
                  onPressed: () {
                    alertlogoutbox();
                  },
                  icon: const Icon(Icons.logout))
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
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
                //CarousalSlider(),
                const SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      children: [
                        Burgers(),
                        recipes(),
                        BBQS(),
                        Biryani(),
                        Chicken(),
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
                      children: foodlist
                          .map((e) => MyContainer(
                                image: e.image,
                                price: e.price,
                                name: e.name,
                                ontap: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => DetailScreen(
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
