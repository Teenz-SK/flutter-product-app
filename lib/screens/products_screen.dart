import 'package:flutter/material.dart';
import '../models/product.dart';
import 'product_details_screen.dart';

class ProductsScreen extends StatelessWidget {

  ProductsScreen({super.key});

  // Dummy Products List
  final List<Product> products = [

    Product(
      name: "Mobile Phone",
      price: 25000,
      description: "High quality smartphone with best performance.",
      icon: Icons.phone_android,
    ),

    Product(
      name: "Laptop",
      price: 55000,
      description: "Powerful laptop for office and study work.",
      icon: Icons.laptop,
    ),

    Product(
      name: "Headphones",
      price: 3000,
      description: "Wireless headphones with deep bass sound.",
      icon: Icons.headphones,
    ),

    Product(
      name: "Smart Watch",
      price: 5000,
      description: "Track your fitness and daily activities.",
      icon: Icons.watch,
    ),

  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
      ),

      body: SafeArea(

        child: ListView.builder(

          padding: const EdgeInsets.all(12),

          itemCount: products.length,

          itemBuilder: (context,index){

            final product = products[index];

            return Card(

              elevation: 3,

              margin: const EdgeInsets.only(bottom: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(

                contentPadding: const EdgeInsets.all(15),

                // Icon
                leading: CircleAvatar(

                  radius: 28,

                  backgroundColor: Colors.blue.shade100,

                  child: Icon(
                    product.icon,
                    size: 30,
                    color: Colors.blue,
                  ),

                ),

                // Product Name
                title: Text(
                  product.name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                // Product Price
                subtitle: Text(
                  "₹${product.price}",
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.green,
                  ),
                ),

                trailing: const Icon(Icons.arrow_forward_ios),

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

    );

  }

}