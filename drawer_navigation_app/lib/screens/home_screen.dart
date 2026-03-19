import 'package:flutter/material.dart';
import 'search_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),

      // 🔥 Drawer
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
              title: const Text("Home"),
              onTap: () {
                Navigator.pop(context);
              },
            ),

            ListTile(
              leading: const Icon(Icons.search),
              title: const Text("Search"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SearchScreen(),
                  ),
                );
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
          "Home Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}