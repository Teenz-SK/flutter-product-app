import 'package:flutter/material.dart';
import 'screens/chats_page.dart';
import 'screens/status_page.dart';
import 'screens/calls_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WhatsApp UI',
      theme: ThemeData(primaryColor: Color(0xFF075E54)),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("WhatsApp"),
          actions: [
            Icon(Icons.search),
            SizedBox(width: 15),
            Icon(Icons.more_vert),
            SizedBox(width: 10),
          ],
          bottom: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: "Chats"),
              Tab(text: "Status"),
              Tab(text: "Calls"),
            ],
          ),
        ),
        body: TabBarView(children: [ChatsPage(), StatusPage(), CallsPage()]),
      ),
    );
  }
}
