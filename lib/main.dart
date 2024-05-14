import 'package:calibre/Components/WeaponShopCard.dart';
import 'package:calibre/Services/WeaponService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: <Widget>[
                  Flexible(
                    child: FutureBuilder(
                      future: WeaponService.getWeapons(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (snapshot.connectionState ==
                            ConnectionState.done) {
                          return ListView.builder(
                              itemBuilder: (context, index) {
                                return WeaponShopCard(
                                    weapon: snapshot.data![index]);
                              },
                              itemCount: snapshot.data!.length);
                        }
                        return const Text("Hello World");
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.home),
                              color: Colors.red,
                            ),
                            const Text(
                              "Home",
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 12.0),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopify),
                              color: Colors.red,
                            ),
                            const Text(
                              "Shop",
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 12.0),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.shopping_cart_sharp),
                              color: Colors.red,
                            ),
                            const Text(
                              "Cart",
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 12.0),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.person),
                              color: Colors.red,
                            ),
                            const Text(
                              "Account",
                              style: TextStyle(
                                  fontFamily: "Inter", fontSize: 12.0),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
