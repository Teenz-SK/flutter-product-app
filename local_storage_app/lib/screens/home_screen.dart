import 'package:flutter/material.dart';
import '../models/note_model.dart';
import '../services/storage_service.dart';
import '../widgets/note_card.dart';

class HomeScreen extends StatefulWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  const HomeScreen({
    super.key,
    required this.isDark,
    required this.toggleTheme,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Note> notes = [];
  List<Note> filtered = [];
  String category = "General";

  final controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    load();
  }

  void load() async {
    final data = await StorageService.loadNotes();
    setState(() {
      notes = data;
      filtered = data;
    });
  }

  void save() async {
    await StorageService.saveNotes(notes);
  }

  void addNote() {
    if (controller.text.isEmpty) return;

    setState(() {
      notes.add(Note(title: controller.text, category: category));
      controller.clear();
      filtered = notes;
    });

    save();
  }

  void deleteNote(int i) {
    setState(() {
      notes.removeAt(i);
      filtered = notes;
    });
    save();
  }

  void search(String value) {
    setState(() {
      filtered = notes
          .where((n) =>
              n.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        actions: [
          IconButton(
            icon: Icon(widget.isDark ? Icons.dark_mode : Icons.light_mode),
            onPressed: widget.toggleTheme,
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),

        child: Column(
          children: [

            // 🔍 SEARCH
            TextField(
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search notes...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // 🔥 INPUT
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: "Enter note...",
                    ),
                  ),
                ),

                DropdownButton<String>(
                  value: category,
                  items: ["General", "Work", "Personal"]
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  onChanged: (val) {
                    setState(() {
                      category = val!;
                    });
                  },
                ),

                IconButton(
                  icon: const Icon(Icons.add, color: Colors.green),
                  onPressed: addNote,
                ),
              ],
            ),

            const SizedBox(height: 10),

            // 📋 LIST
            Expanded(
              child: filtered.isEmpty
                  ? const Center(child: Text("No Notes"))
                  : ListView.builder(
                      itemCount: filtered.length,
                      itemBuilder: (context, i) {
                        return NoteCard(
                          note: filtered[i],
                          onDelete: () => deleteNote(i),
                          onEdit: () {},
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