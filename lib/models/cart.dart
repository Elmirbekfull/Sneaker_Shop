import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier {
  // выставить обувь на продажу
  List<Shoe> shoeShop = [
    Shoe(
        name: "Air Jordan",
        price: "240",
        imagePatch: "assets/images/3.png",
        description: "Крутая обувь"),
    Shoe(
        name: "Air Jordan",
        price: "240",
        imagePatch: "assets/images/4.png",
        description: "Крутая обувь"),
    Shoe(
        name: "Zoom Freak",
        price: "200",
        imagePatch: "assets/images/1.png",
        description: "Линейка баскетбольной обуви"),
    Shoe(
        name: "KD Treys",
        price: "240",
        imagePatch: "assets/images/2.png",
        description: "Предлагают уникальные детали"),
    Shoe(
        name: "KD Treys",
        price: "240",
        imagePatch: "assets/images/5.png",
        description: "Предлагают уникальные детали"),
  ];

  // список товаров в корзине пользователя
  List<Shoe> userCart = [];

  // получить список обуви для продажи

  List<Shoe> getShoeList() {
    return shoeShop;
  }

  // получить корзину

  List<Shoe> getUserCart() {
    return userCart;
  }

  // добавить товары в корзину
  void addItemToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  // удалить товар из корзины

  void removeItemFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
