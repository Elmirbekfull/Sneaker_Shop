import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/contants/shoeTile.dart';
import 'package:sneaker_shop/models/shoe.dart';

import '../models/cart.dart';

class ShopPages extends StatefulWidget {
  ShopPages({
    super.key,
  });

  @override
  State<ShopPages> createState() => _ShopPagesState();
}

class _ShopPagesState extends State<ShopPages> {
  // добавить распродажы на корзину
  void addShoeToCart(Shoe shoe) {
    Provider.of<Cart>(context, listen: false).addItemToCart(shoe);
    // alert the user, shoes succusfully added
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              backgroundColor: Colors.grey.shade800,
              icon: const Icon(
                Icons.done,
                color: Colors.white,
              ),
              title: const Text(
                "Успешно добавлено",
                style: TextStyle(color: Colors.green),
              ),
              content: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Проверьте свою карзину',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return Consumer<Cart>(
      builder: (context, value, childe) => Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.symmetric(horizontal: 25.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Искать",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                ),
                Icon(
                  Icons.search,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          SizedBox(
            height: mySize.height * 0.03,
          ),
          Text(
            "все летают.. одни летают дольше других",
            style: TextStyle(color: Colors.grey.shade700, fontSize: 17),
          ),
          SizedBox(
            height: mySize.height * 0.04,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 25.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "Горячие выборы 🔥",
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Все",
                  style: TextStyle(
                      color: Colors.blue, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: mySize.height * 0.03,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    // get a shoe from shop list
                    Shoe shoe = value.getShoeList()[index];
                    // return the shoe
                    return ShoeTile(
                      shoe: shoe,
                      onTap: () => addShoeToCart(shoe),
                    );
                  })),
          const Padding(
            padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
            child: Divider(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
