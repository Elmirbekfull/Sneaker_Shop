import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe.dart';
import '../models/cart.dart';

// ignore: must_be_immutable
class CartItem extends StatefulWidget {
  Shoe shoe;
  CartItem({super.key, required this.shoe});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  // delete shoes
  void removeItemFromCart() {
    // Provider.of<Cart>(context, listen: false).removeItemFromCart(widget.shoe);
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.grey.shade800,
            icon: const Icon(
              Icons.info,
              color: Colors.white,
              size: 40,
            ),
            title: const Text(
              "Вы дествительно хотите удалить ?",
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                            padding: EdgeInsets.all(10),
                            width: 100,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.red),
                            child: const Center(
                              child: Text(
                                "Нет",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ))),
                    TextButton(
                        onPressed: () {
                          Provider.of<Cart>(context, listen: false)
                              .removeItemFromCart(widget.shoe);
                        },
                        child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.green),
                            child: const Center(
                              child: Text(
                                "Да",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                            ))),
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[100],
      ),
      child: ListTile(
        leading: Image.asset(widget.shoe.imagePatch),
        title: Text(widget.shoe.name),
        subtitle: Text(widget.shoe.price),
        trailing: IconButton(
          icon: const Icon(
            Icons.delete,
          ),
          onPressed: removeItemFromCart,
        ),
      ),
    );
  }
}
