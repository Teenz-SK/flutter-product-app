import 'package:flutter/material.dart';

class ChatsPage extends StatelessWidget {
  final List data = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundImage: NetworkImage(
                "https://i.pravatar.cc/150?img=${index + 1}",
              ),
            ),
            title: Text(
              "User $index",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text("Last message preview..."),
            trailing: Text("10:${index}0 AM"),
          ),
        );
      },
    );
  }
}