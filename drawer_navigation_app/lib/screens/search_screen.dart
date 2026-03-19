import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'profile_screen.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),

      drawer: Drawer(
        child: Column(
          children: [

            const UserAccountsDrawerHeader(
              accountName: Text("Sanju"),
              accountEmail: Text("sanju@email.com"),
              currentAccountPicture: CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              },
            ),

            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Profile"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
            ),

          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Search Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}