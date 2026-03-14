import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Root App
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RefreshListScreen(),
    );
  }
}

// Main Screen with Pull To Refresh
class RefreshListScreen extends StatefulWidget {
  const RefreshListScreen({super.key});

  @override
  State<RefreshListScreen> createState() => _RefreshListScreenState();
}

class _RefreshListScreenState extends State<RefreshListScreen> {

  // List to store items
  List<String> items = [];

  @override
  void initState() {
    super.initState();
    generateItems();
  }

  // Generate 20–30 items
  void generateItems() {
    items = List.generate(
      25,
      (index) => "Item ${index + 1}",
    );
  }

  // Simulate API call with delay
  Future<void> refreshData() async {

    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      items = List.generate(
        25,
        (index) => "New Item ${index + 1}",
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Pull To Refresh"),
        centerTitle: true,
        elevation: 0,
      ),

      body: RefreshIndicator(

        // Triggered when user pulls down
        onRefresh: refreshData,

        child: ListView.builder(
          padding: const EdgeInsets.all(15),
          itemCount: items.length,

          itemBuilder: (context, index) {

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 12),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),

              child: ListTile(

                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Text(
                    "${index + 1}",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                title: Text(
                  items[index],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),

                subtitle: const Text(
                  "Swipe down to refresh list",
                ),

                trailing: const Icon(Icons.arrow_forward_ios, size: 16),

              ),
            );
          },
        ),
      ),
    );
  }
}