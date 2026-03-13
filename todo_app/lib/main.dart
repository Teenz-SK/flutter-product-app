import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  String title;
  bool isDone;

  Todo({required this.title, this.isDone = false});
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Professional Todo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: "Arial",
        scaffoldBackgroundColor: const Color(0xffF5F5F5),
      ),
      home: const TodoPage(),
    );
  }
}

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos = [];

  final TextEditingController controller = TextEditingController();

  bool showAddField = false;

  // ADD TASK
  void addTask() {
    if (controller.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task is mandatory")),
      );
      return;
    }

    setState(() {
      todos.add(Todo(title: controller.text));
      controller.clear();
      showAddField = false;
    });
  }

  // DELETE
  void deleteTask(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  // EDIT TASK (DIALOG)
  void editTask(int index) {
    controller.text = todos[index].title;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: const Text("Edit Task"),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              labelText: "Task",
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              child: const Text("Cancel"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text("Update"),
              onPressed: () {
                if (controller.text.trim().isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Task cannot be empty")),
                  );
                  return;
                }

                setState(() {
                  todos[index].title = controller.text;
                });

                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Widget taskCard(Todo todo, int index) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        leading: Checkbox(
          value: todo.isDone,
          onChanged: (value) {
            setState(() {
              todo.isDone = value!;
            });
          },
        ),
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 16,
            decoration: todo.isDone
                ? TextDecoration.lineThrough
                : TextDecoration.none,
          ),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit, color: Colors.orange),
              onPressed: () {
                editTask(index);
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                deleteTask(index);
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget addTaskField() {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: "Enter new task...",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.check, color: Colors.green),
            onPressed: addTask,
          )
        ],
      ),
    );
  }

  Widget header() {
    return const Padding(
      padding: EdgeInsets.fromLTRB(16, 40, 16, 20),
      child: Row(
        children: [
          Icon(Icons.check_box, size: 28),
          SizedBox(width: 10),
          Text(
            "My Tasks",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }

  Widget emptyState() {
    return const Center(
      child: Text(
        "No tasks yet\nTap + to add",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 18,
          color: Colors.grey,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            showAddField = true;
          });
        },
      ),
      body: Column(
        children: [
          header(),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  if (showAddField) addTaskField(),

                  Expanded(
                    child: todos.isEmpty
                        ? emptyState()
                        : ListView.builder(
                            itemCount: todos.length,
                            itemBuilder: (context, index) {
                              return taskCard(todos[index], index);
                            },
                          ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}