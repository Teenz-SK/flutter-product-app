import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  final TextEditingController controller = TextEditingController();
  List<String> tasks = [];

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  // 🔹 Load saved tasks
  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString("tasks");

    if (data != null) {
      setState(() {
        tasks = List<String>.from(json.decode(data));
      });
    }
  }

  // 🔹 Save tasks
  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("tasks", json.encode(tasks));
  }

  // 🔹 Add task
  void addTask() {
    if (controller.text.trim().isEmpty) return;

    setState(() {
      tasks.add(controller.text);
      controller.clear();
    });

    saveTasks();
  }

  // 🔹 Delete task
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });

    saveTasks();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            // 🔹 Input
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter task...",
                    ),
                  ),
                ),

                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: addTask,
                )
              ],
            ),

            const SizedBox(height: 10),

            // 🔹 Task List
            Expanded(
              child: tasks.isEmpty
                  ? const Center(child: Text("No tasks"))
                  : ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {

                        return Card(
                          child: ListTile(
                            title: Text(tasks[index]),

                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () => deleteTask(index),
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