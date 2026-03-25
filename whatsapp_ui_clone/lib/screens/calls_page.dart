import 'package:flutter/material.dart';

class CallsPage extends StatelessWidget {
  final List data = List.generate(10, (index) => index);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage("https://i.pravatar.cc/150?img=${index + 5}"),
          ),
          title: Text("Caller $index",
              style: TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Row(
            children: [
              Icon(
                index % 2 == 0 ? Icons.call_received : Icons.call_made,
                color: index % 2 == 0 ? Colors.red : Colors.green,
                size: 16,
              ),
              SizedBox(width: 5),
              Text("Yesterday, 9:${index}0 PM"),
            ],
          ),
          trailing: Icon(
            index % 2 == 0 ? Icons.call : Icons.videocam,
            color: Colors.green,
          ),
        );
      },
    );
  }
}