import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/counter_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Counter',
      theme: ThemeData(primarySwatch: Colors.green),
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Counter"), centerTitle: true),
      body: Center(
        child: Obx(
          () => Text(
            controller.count.toString(),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "inc",
            onPressed: controller.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(height: 12),
          FloatingActionButton(
            heroTag: "dec",
            onPressed: controller.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
