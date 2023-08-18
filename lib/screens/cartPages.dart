import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/contants/curt_item.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../models/cart.dart';

class CartPages extends StatefulWidget {
  const CartPages({super.key});

  @override
  State<CartPages> createState() => _CartPagesState();
}

class _CartPagesState extends State<CartPages> {
  // remove item from cart

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Мои Корзины",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context, index) {
                  // get individual shoe
                  Shoe individualShoe = value.getUserCart()[index];
                  // returm the cart item
                  return CartItem(shoe: individualShoe);
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
