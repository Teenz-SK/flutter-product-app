import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {

  ProductsScreen({super.key});

  // Dummy Product Data
  final List<Product> products = [

    Product(
      name: "Laptop",
      price: 55000,
      description: "High performance laptop suitable for work and gaming.",
    ),

    Product(
      name: "Mobile Phone",
      price: 25000,
      description: "Latest smartphone with excellent camera quality.",
    ),

    Product(
      name: "Headphones",
      price: 3000,
      description: "Wireless headphones with noise cancellation feature.",
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),

      body: ListView.builder(

        itemCount: products.length,

        itemBuilder: (context, index) {

          final product = products[index];

          return Card(

            margin: const EdgeInsets.all(12),

            elevation: 3,

            child: ListTile(

              title: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              subtitle: Text("₹${product.price}"),

              trailing: const Icon(Icons.arrow_forward_ios),

              onTap: () {

                // Passing FULL model object
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

    );

  }

}