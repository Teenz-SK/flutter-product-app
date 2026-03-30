import 'package:flutter/material.dart';
import '../models/item_model.dart';
import '../widgets/expandable_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? expandedIndex;

  List<ItemModel> items = [
    ItemModel(
        title: "Task 1", description: "Complete Flutter UI"),
    ItemModel(
        title: "Task 2", description: "Implement API"),
    ItemModel(
        title: "Task 3", description: "Fix bugs"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("Expandable List"),
        centerTitle: true,
      ),

      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ExpandableCard(
            item: items[index],
            isExpanded: expandedIndex == index,

            onTap: () {
              setState(() {
                expandedIndex =
                    expandedIndex == index ? null : index;
              });
            },

            onToggle: () {
              setState(() {
                items[index].isActive =
                    !items[index].isActive;
              });
            },
          );
        },
      ),
    );
  }
}