import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_details_screen.dart';
import 'posts_screen.dart';

class ProductsScreen extends StatelessWidget {

  ProductsScreen({super.key});

  final List<Product> products = [

    Product(
      name: "Laptop",
      price: 55000,
      description: "High performance laptop suitable for work.",
    ),

    Product(
      name: "Mobile Phone",
      price: 25000,
      description: "Latest smartphone with excellent camera.",
    ),

    Product(
      name: "Headphones",
      price: 3000,
      description: "Wireless headphones with noise cancellation.",
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),

      body: Column(

        children: [

          const SizedBox(height: 10),

          // BUTTON TO POSTS SCREEN
          ElevatedButton(

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PostsScreen(),
                ),
              );

            },

            child: const Text("View API Posts"),

          ),

          const SizedBox(height: 10),

          Expanded(

            child: ListView.builder(

              itemCount: products.length,

              itemBuilder: (context, index) {

                final product = products[index];

                return Card(

                  margin: const EdgeInsets.all(10),

                  child: ListTile(

                    title: Text(product.name),

                    subtitle: Text("₹${product.price}"),

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductDetailsScreen(product: product),
                        ),
                      );

                    },

                  ),

                );

              },

            ),

          ),

        ],

      ),

    );

  }

}