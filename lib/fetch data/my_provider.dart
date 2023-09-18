// ignore_for_file: avoid_function_literals_in_foreach_calls, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../models/cart_model.dart';
import '../models/categories_model.dart';
import '../models/sub_categories_model.dart';
import '../models/food_model.dart';

class MyProvider extends ChangeNotifier {
  //Burger Category//
  List<CategoriesModel> burgerList = [];
  late CategoriesModel burgerModel;
  Future<void> getBurgerCategories() async {
    List<CategoriesModel> newburgerList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('z6vYWmCTZbJES87U7KCv')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerModel =
          CategoriesModel(name: element['name'], image: element['imgage']);
      newburgerList.add(burgerModel);
      burgerList = newburgerList;
    });
    notifyListeners();
  }

  get throwburgerlist {
    return burgerList;
  }

  ///////////////// Second Category
  List<CategoriesModel> recipeList = [];
  late CategoriesModel recipeModel;
  Future<void> getRecipes() async {
    List<CategoriesModel> newreipeList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('z6vYWmCTZbJES87U7KCv')
        .collection('Recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeModel =
          CategoriesModel(name: element['name'], image: element['image']);
      newreipeList.add(recipeModel);
      recipeList = newreipeList;
    });

    notifyListeners();
  }

  get throwrecipeList {
    return recipeList;
  }

  ///3rd Category//////
  List<CategoriesModel> bbqList = [];
  late CategoriesModel bbqModel;
  Future<void> getbbqCategories() async {
    List<CategoriesModel> newbbqList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('z6vYWmCTZbJES87U7KCv')
        .collection('bbq')
        .get();
    querySnapshot.docs.forEach((element) {
      bbqModel =
          CategoriesModel(name: element['name'], image: element['image']);
      newbbqList.add(bbqModel);
      bbqList = newbbqList;
    });
    notifyListeners();
  }

  get throwbbqList {
    return bbqList;
  }

  /////////4th Category
  List<CategoriesModel> biryaniList = [];
  late CategoriesModel biryaniModel;
  Future<void> getBiryaniCategories() async {
    List<CategoriesModel> newbiryaniList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('z6vYWmCTZbJES87U7KCv')
        .collection('biryani')
        .get();
    querySnapshot.docs.forEach((element) {
      biryaniModel =
          CategoriesModel(name: element['name'], image: element['image']);
      newbiryaniList.add(biryaniModel);
      biryaniList = newbiryaniList;
    });

    notifyListeners();
  }

  get throwbiryanilist {
    return biryaniList;
  }

  List<CategoriesModel> karahiList = [];
  late CategoriesModel karahiModel;
  Future<void> getkarahi() async {
    List<CategoriesModel> newkarahiList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('categories')
        .doc('z6vYWmCTZbJES87U7KCv')
        .collection('karahi')
        .get();
    querySnapshot.docs.forEach((element) {
      karahiModel =
          CategoriesModel(name: element['name'], image: element['image']);
      print(karahiModel.name);
      newkarahiList.add(karahiModel);
      karahiList = newkarahiList;
    });

    notifyListeners();
  }

  get throwkarahiList {
    return karahiList;
  }

  /////////this is for the girdview/////////
  List<FoodModel> foodList = [];
  late FoodModel foodModel;
  Future<void> getFoodList() async {
    List<FoodModel> newFoodList = [];
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('foods').get();
    querySnapshot.docs.forEach((element) {
      foodModel = FoodModel(
          name: element['name'],
          image: element['image'],
          price: element['price']);
      newFoodList.add(foodModel);
      print(foodModel.name);
    });

    foodList = newFoodList;
  }

  get throwFoodList {
    return foodList;
  }

  //Food Burger Categories///
  ////Here all the Burger Categories/////
  List<FoodCategoriesModel> burgerCategoriesList = [];
  late FoodCategoriesModel burgerCategoriesModel;
  Future<void> getBurgerCategoriesList() async {
    List<FoodCategoriesModel> newburgerCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('Mpze1PTBmTLziL63rerO')
        .collection('burger')
        .get();
    querySnapshot.docs.forEach((element) {
      burgerCategoriesModel = FoodCategoriesModel(
          name: element['name'],
          price: element['price'],
          image: element['image']);
      newburgerCategoriesList.add(burgerCategoriesModel);
      print(burgerCategoriesModel.name);
    });
    burgerCategoriesList = newburgerCategoriesList;
  }

  get throwburgerCategoriesList {
    return burgerCategoriesList;
  }

  ////Here all the Recipe Categories/////
  List<FoodCategoriesModel> recipeCategoriesList = [];
  late FoodCategoriesModel recipeCategoriesModel;
  Future<void> getRecipeCategoriesList() async {
    List<FoodCategoriesModel> newrecipeCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('Mpze1PTBmTLziL63rerO')
        .collection('recipe')
        .get();
    querySnapshot.docs.forEach((element) {
      recipeCategoriesModel = FoodCategoriesModel(
          name: element['name'],
          price: element['price'],
          image: element['image']);
      newrecipeCategoriesList.add(recipeCategoriesModel);
      print(recipeCategoriesModel.price);
    });
    recipeCategoriesList = newrecipeCategoriesList;
  }

  get throwRecipeCatList {
    return recipeCategoriesList;
  }

  ////Here all the BBq Categories/////
  List<FoodCategoriesModel> bbqCategoriesList = [];
  late FoodCategoriesModel bbqCategoriesModel;
  Future<void> getBBQCategoriesList() async {
    List<FoodCategoriesModel> newbbqCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('Mpze1PTBmTLziL63rerO')
        .collection('pizza')
        .get();
    querySnapshot.docs.forEach((element) {
      bbqCategoriesModel = FoodCategoriesModel(
          name: element['name'],
          price: element['price'],
          image: element['image']);
      newbbqCategoriesList.add(bbqCategoriesModel);
      print(bbqCategoriesModel.price);
    });
    bbqCategoriesList = newbbqCategoriesList;
  }

  get throwBBQCatList {
    return bbqCategoriesList;
  }

  ////Here all the Biryani Categories/////
  List<FoodCategoriesModel> biryaniCategoriesList = [];
  late FoodCategoriesModel biryaniCategoriesModel;
  Future<void> getBiryaniCategoriesList() async {
    List<FoodCategoriesModel> newbiryaniCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('Mpze1PTBmTLziL63rerO')
        .collection('biryani')
        .get();
    querySnapshot.docs.forEach((element) {
      biryaniCategoriesModel = FoodCategoriesModel(
          name: element['name'],
          price: element['price'],
          image: element['image']);
      newbiryaniCategoriesList.add(biryaniCategoriesModel);
    });
    biryaniCategoriesList = newbiryaniCategoriesList;
  }

  get throwBiryaniCatList {
    return biryaniCategoriesList;
  }

  ////Here all the Karahi Categories/////
  List<FoodCategoriesModel> karahiCategoriesList = [];
  late FoodCategoriesModel karahiCategoriesModel;
  Future<void> getKarahiCategoriesList() async {
    List<FoodCategoriesModel> newkarahiCategoriesList = [];
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('FoodCategories')
        .doc('Mpze1PTBmTLziL63rerO')
        .collection('karahi')
        .get();
    querySnapshot.docs.forEach((element) {
      karahiCategoriesModel = FoodCategoriesModel(
          name: element['name'],
          price: element['price'],
          image: element['image']);
      newkarahiCategoriesList.add(karahiCategoriesModel);
      print(karahiCategoriesModel.price);
    });
    karahiCategoriesList = newkarahiCategoriesList;
  }

  get throwKarahiCatList {
    return karahiCategoriesList;
  }

/////add to cart////
  List<CartModel> cartList = [];
  List<CartModel> newCartList = [];
  late CartModel cartModel;
  void addToCart(
      {required String image,
      required int quantity,
      required int price,
      required name}) {
    cartModel =
        CartModel(price: price, image: image, quantity: quantity, name: name);
    newCartList.add(cartModel);
    cartList = newCartList;
  }

  get throwCartList {
    return cartList;
  }

  int totalprice() {
    int total = 0;
    cartList.forEach((element) {
      total += element.price * element.quantity;
    });
    return total;
  }

  late int deleteIndex;
  void getdeleteIndex(int index) {
    deleteIndex = index;
  }

  void delete() {
    cartList.removeAt(deleteIndex);
    notifyListeners();
  }
}
