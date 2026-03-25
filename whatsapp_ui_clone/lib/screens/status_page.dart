import 'package:flutter/material.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Stack(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage:
                    NetworkImage("https://i.pravatar.cc/150?img=1"),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.add, size: 15, color: Colors.white),
                ),
              ),
            ],
          ),
          title: Text("My Status"),
          subtitle: Text("Tap to add status"),
        ),

        Padding(
          padding: EdgeInsets.all(10),
          child: Text("Recent Updates",
              style: TextStyle(fontWeight: FontWeight.bold)),
        ),

        ...List.generate(5, (index) {
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                  "https://i.pravatar.cc/150?img=${index + 2}"),
            ),
            title: Text("Friend $index"),
            subtitle: Text("Today, 12:${index}0 PM"),
          );
        }),
      ],
    );
  }
}