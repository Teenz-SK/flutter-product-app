import 'package:flutter/material.dart';
import 'products_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),

      body: SafeArea(

        child: Center(

          child: ElevatedButton(

            onPressed: () {

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductsScreen(),
                ),
              );

            },

            child: const Text(
              "View Products",
              style: TextStyle(fontSize: 18),
            ),

          ),

        ),

      ),

    );
  }
}