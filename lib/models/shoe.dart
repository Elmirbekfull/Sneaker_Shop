class Shoe {
  final String name;
  final String price;
  final String imagePatch;
  final String description;
  Shoe(
      {required this.name,
      required this.price,
      required this.imagePatch,
      required this.description});

  void removeItemFromCart(Shoe shoe) {}
}
