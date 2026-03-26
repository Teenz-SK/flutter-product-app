import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../services/api_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> users = [];
  List<User> filteredUsers = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadUsers();
  }

  void loadUsers() async {
    try {
      final data = await ApiService.fetchUsers();
      setState(() {
        users = data;
        filteredUsers = data;
        isLoading = false;
      });
    } catch (e) {
      print("ERROR: $e");
    }
  }

  void searchUser(String query) {
    final result = users.where((user) {
      return user.name.toLowerCase().contains(query.toLowerCase());
    }).toList();

    setState(() {
      filteredUsers = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(title: Text("User Search"), centerTitle: true),

      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                // 🔍 Search Field
                Padding(
                  padding: EdgeInsets.all(12),
                  child: TextField(
                    onChanged: searchUser,
                    decoration: InputDecoration(
                      hintText: "Search user...",
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),

                // 📋 List
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredUsers.length,
                    itemBuilder: (context, index) {
                      final user = filteredUsers[index];

                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: CircleAvatar(child: Text(user.name[0])),
                          title: Text(
                            user.name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(user.email),
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
