import 'package:flutter/material.dart';
import 'package:sneaker_shop/contants/bottomNavBar.dart';
import 'package:sneaker_shop/screens/CartPages.dart';
import 'package:sneaker_shop/screens/shopPage.dart';
import 'package:sneaker_shop/screens/welcome_sneaker_shop.dart';

class ViewSneakerShop extends StatefulWidget {
  const ViewSneakerShop({super.key});

  @override
  State<ViewSneakerShop> createState() => _ViewSneakerShopState();
}

class _ViewSneakerShopState extends State<ViewSneakerShop> {
  int _selectedTab = 0;
  void navigateBottomBar(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  final List<Widget> _pages = [
    // shop pages
    ShopPages(),
    // cart pages
    const CartPages()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Padding(
              padding: EdgeInsets.only(left: 15),
              child: Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Padding(
          padding: const EdgeInsets.only(left: 25.0, bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  DrawerHeader(
                    child: Image.asset(
                      'assets/images/nike.png', // Исправлено на одинарные кавычки
                      color: Colors.white,
                      height: 200,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Divider(
                      color: Colors.grey[800],
                    ),
                  ),
                  const Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.home,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Домой', // Исправлено на одинарные кавычки
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.info,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Информация', // Исправлено на одинарные кавычки
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: Text(
                          'настройки', // Исправлено на одинарные кавычки
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      ListTile(
                        leading: Icon(
                          Icons.share,
                          color: Colors.white,
                        ),
                        title: Text(
                          'Поделиться', // Исправлено на одинарные кавычки
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => WelcomeSneakerShop()));
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Выйти', // Исправлено на одинарные кавычки
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedTab],
    );
  }
}
