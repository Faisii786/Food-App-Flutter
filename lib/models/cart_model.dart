class CartModel {
  final String image;
  final int price;
  final int quantity;
  String name;
  CartModel(
      {required this.price,
      required this.image,
      required this.quantity,
      required this.name});
}
