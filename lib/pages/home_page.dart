import 'package:flutter/material.dart';
import 'package:catalog_appzs/models/catalog.dart';
import 'package:catalog_appzs/models/cart.dart';
import 'package:catalog_appzs/utils/routes.dart';
import '../utils/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _cart = CartModel();
  final _catalog = CatalogModel();

  @override
  void initState() {
    super.initState();
    _cart.catalog = _catalog;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f3f6), // Light background for white cards
      appBar: AppBar(
        title: const Text("Catalog App"),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Text(
              "Trending Products",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: 0.7,
                ),
                itemCount: CatalogModel.items.length,
                itemBuilder: (context, index) {
                  final item = CatalogModel.items[index];
                  bool isInCart = _cart.items.contains(item);
                  return Card(
                    color: Colors.white, // Card background set to white
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      children: [
                        Expanded(
                          child: Hero(
                            tag: Key(item.id.toString()),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: item.image.startsWith("http")
                                  ? Image.network(item.image,
                                      fit: BoxFit.contain)
                                  : Image.asset(item.image,
                                      fit: BoxFit.contain),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                item.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.deepPurple),
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 5),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "\$${item.price}",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (!isInCart) {
                                          _cart.add(item);
                                        } else {
                                          _cart.remove(item);
                                        }
                                      });
                                    },
                                    child: AnimatedContainer(
                                      duration: const Duration(seconds: 1),
                                      width: isInCart ? 40 : 40,
                                      height: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.black, // Changed from deepPurple to black
                                        borderRadius: BorderRadius.circular(
                                            isInCart ? 20 : 8),
                                      ),
                                      child: isInCart
                                          ? const Icon(
                                              Icons.done,
                                              color: Colors.white,
                                              size: 20,
                                            )
                                          : const Icon(
                                              Icons.add_shopping_cart,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
      drawer: const MyDrawer(),
    );
  }
}
