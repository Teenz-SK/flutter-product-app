import 'package:flutter/material.dart';
import '../models/shopping_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {

  // TextField Controller
  TextEditingController controller = TextEditingController();

  // Shopping List
  List<ShoppingItem> items = [];

  // Add Item
  void addItem() {

    if(controller.text.isEmpty) return;

    setState(() {

      items.add(
        ShoppingItem(
          name: controller.text,
        ),
      );

      controller.clear();

    });

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Shopping List"),
        centerTitle: true,
      ),

      body: Padding(

        padding: const EdgeInsets.all(15),

        child: Column(

          children: [

            // Input Field
            TextField(

              controller: controller,

              decoration: InputDecoration(

                hintText: "Enter Product Name",

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),

                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addItem,
                ),

              ),

              onSubmitted: (value){
                addItem();
              },

            ),

            const SizedBox(height: 20),

            // List
            Expanded(

              child: ListView.builder(

                itemCount: items.length,

                itemBuilder: (context,index){

                  return Card(

                    margin: const EdgeInsets.only(bottom: 10),

                    child: ListTile(

                      title: Text(
                        items[index].name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      trailing: Row(

                        mainAxisSize: MainAxisSize.min,

                        children: [

                          // Decrease
                          IconButton(

                            icon: const Icon(Icons.remove),

                            onPressed: (){

                              setState(() {

                                if(items[index].quantity > 1){

                                  items[index].quantity--;

                                }

                              });

                            },

                          ),

                          // Quantity
                          Text(
                            items[index].quantity.toString(),
                            style: const TextStyle(fontSize: 18),
                          ),

                          // Increase
                          IconButton(

                            icon: const Icon(Icons.add),

                            onPressed: (){

                              setState(() {

                                items[index].quantity++;

                              });

                            },

                          ),

                          // Delete
                          IconButton(

                            icon: const Icon(Icons.delete,color: Colors.red),

                            onPressed: (){

                              setState(() {

                                items.removeAt(index);

                              });

                            },

                          ),

                        ],

                      ),

                    ),

                  );

                },

              ),

            ),

          ],

        ),

      ),

    );

  }

}