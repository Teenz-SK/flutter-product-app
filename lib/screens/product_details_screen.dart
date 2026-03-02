import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductDetailsScreen extends StatelessWidget {

  final Product product;

  const ProductDetailsScreen({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Product Details"),
        centerTitle: true,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Padding(

            padding: const EdgeInsets.all(20),

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.center,

              children: [

                const SizedBox(height: 20),

                // Product Icon
                CircleAvatar(

                  radius: 70,

                  backgroundColor: Colors.blue.shade100,

                  child: Icon(
                    product.icon,
                    size: 70,
                    color: Colors.blue,
                  ),

                ),

                const SizedBox(height: 30),

                // Product Name
                Text(

                  product.name,

                  textAlign: TextAlign.center,

                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                const SizedBox(height: 15),

                // Price
                Text(

                  "₹${product.price}",

                  style: const TextStyle(
                    fontSize: 22,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),

                ),

                const SizedBox(height: 30),

                // Description Title
                const Align(

                  alignment: Alignment.centerLeft,

                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ),

                const SizedBox(height: 10),

                // Description Text
                Text(

                  product.description,

                  textAlign: TextAlign.justify,

                  style: const TextStyle(
                    fontSize: 16,
                    height: 1.5,
                  ),

                ),

                const SizedBox(height: 20),

              ],

            ),

          ),

        ),

      ),

    );

  }

}