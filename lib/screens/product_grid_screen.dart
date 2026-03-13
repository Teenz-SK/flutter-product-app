import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductGridScreen extends StatelessWidget {
  ProductGridScreen({super.key});

  final List<Product> products = [
    Product(name: "Laptop", price: 80000, icon: Icons.laptop),
    Product(name: "Phone", price: 40000, icon: Icons.phone_android),
    Product(name: "Headphones", price: 3000, icon: Icons.headphones),
    Product(name: "Watch", price: 5000, icon: Icons.watch),
    Product(name: "Camera", price: 60000, icon: Icons.camera_alt),
    Product(name: "Speaker", price: 4500, icon: Icons.speaker),
  ];

  void showTopMessage(BuildContext context, String name) {

    ScaffoldMessenger.of(context).clearMaterialBanners();

    ScaffoldMessenger.of(context).showMaterialBanner(
      MaterialBanner(
        content: Text("$name clicked"),
        leading: const Icon(Icons.shopping_cart),
        backgroundColor: Colors.blue.shade100,
        actions: [
          TextButton(
            onPressed: () {
              ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
            },
            child: const Text("OK"),
          )
        ],
      ),
    );

    Future.delayed(const Duration(seconds: 2), () {
      ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Grid"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12),

        child: GridView.builder(

          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 1,
          ),

          itemCount: products.length,

          itemBuilder: (context, index) {

            final product = products[index];

            return GestureDetector(

              onTap: () {
                showTopMessage(context, product.name);
              },

              child: Container(

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(2, 3),
                    )
                  ],
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Icon(
                      product.icon,
                      size: 50,
                      color: Colors.blue,
                    ),

                    const SizedBox(height: 10),

                    Text(
                      product.name,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 5),

                    Text(
                      "₹${product.price}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}