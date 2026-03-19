import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'search_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
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
              title: const Text("Home"),
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
                Navigator.pop(context);
              },
            ),

          ],
        ),
      ),

      body: const Center(
        child: Text(
          "Profile Screen",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}