import 'package:flutter/material.dart';
import 'package:sneaker_shop/screens/view_sneaker_shop.dart';

class WelcomeSneakerShop extends StatefulWidget {
  const WelcomeSneakerShop({super.key});

  @override
  State<WelcomeSneakerShop> createState() => _WelcomeSneakerShopState();
}

class _WelcomeSneakerShopState extends State<WelcomeSneakerShop> {
  @override
  Widget build(BuildContext context) {
    Size mySize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Image.asset(
                  "assets/images/nike.png",
                  height: 240,
                ),
              ),
              SizedBox(
                height: mySize.height * 0.05,
              ),
              const Text(
                'Просто сделай это',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Приветствуем вас на увлекательной магазин онлайн кроссовок будущего - Nike AirMax Fusion. Давайте погрузимся в мир инноваций и стиля!',
                style: TextStyle(fontSize: 18, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 48,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const ViewSneakerShop()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(25.0),
                    child: Center(
                      child: Text(
                        "Магазин сейчас",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
