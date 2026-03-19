// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class StorageScreen extends StatefulWidget {
//   const StorageScreen({super.key});

//   @override
//   State<StorageScreen> createState() => _StorageScreenState();
// }

// class _StorageScreenState extends State<StorageScreen> {

//   final TextEditingController controller = TextEditingController();

//   List<String> notes = [];
//   String message = "";

//   @override
//   void initState() {
//     super.initState();
//     loadNotes();
//   }

//   // 🔹 LOAD NOTES
//   Future<void> loadNotes() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       String? data = prefs.getString("notes");

//       if (data != null) {
//         setState(() {
//           notes = List<String>.from(json.decode(data));
//         });
//       }

//     } catch (e) {
//       setState(() {
//         message = "Failed to load data ❌";
//       });
//     }
//   }

//   // 🔹 SAVE NOTES
//   Future<void> saveNotes() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       await prefs.setString("notes", json.encode(notes));
//     } catch (e) {
//       setState(() {
//         message = "Failed to save data ❌";
//       });
//     }
//   }

//   // 🔹 ADD NOTE
//   void addNote() {
//     if (controller.text.trim().isEmpty) {
//       setState(() {
//         message = "Field cannot be empty ⚠️";
//       });
//       return;
//     }

//     setState(() {
//       notes.add(controller.text);
//       controller.clear();
//       message = "Note added ✅";
//     });

//     saveNotes();
//   }

//   // 🔹 DELETE NOTE
//   void deleteNote(int index) {
//     setState(() {
//       notes.removeAt(index);
//       message = "Note deleted 🗑️";
//     });

//     saveNotes();
//   }

//   // 🔹 EDIT NOTE
//   void editNote(int index) {
//     controller.text = notes[index];

//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text("Edit Note"),
//           content: TextField(
//             controller: controller,
//             decoration: const InputDecoration(
//               border: OutlineInputBorder(),
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Cancel"),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 if (controller.text.trim().isEmpty) return;

//                 setState(() {
//                   notes[index] = controller.text;
//                   controller.clear();
//                 });

//                 saveNotes();
//                 Navigator.pop(context);
//               },
//               child: const Text("Update"),
//             ),
//           ],
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,

//       appBar: AppBar(
//         title: const Text("Notes App"),
//         centerTitle: true,
//       ),

//       body: Padding(
//         padding: const EdgeInsets.all(16),

//         child: Column(
//           children: [

//             // 🔥 INPUT CARD
//             Container(
//               padding: const EdgeInsets.all(15),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//                 boxShadow: const [
//                   BoxShadow(color: Colors.black12, blurRadius: 5)
//                 ],
//               ),
//               child: Column(
//                 children: [

//                   TextField(
//                     controller: controller,
//                     decoration: InputDecoration(
//                       hintText: "Enter note...",
//                       prefixIcon: const Icon(Icons.note),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                   ),

//                   const SizedBox(height: 10),

//                   SizedBox(
//                     width: double.infinity,
//                     child: ElevatedButton(
//                       onPressed: addNote,
//                       child: const Text("Add Note"),
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const SizedBox(height: 10),

//             if (message.isNotEmpty)
//               Text(
//                 message,
//                 style: const TextStyle(color: Colors.red),
//               ),

//             const SizedBox(height: 10),

//             // 🔥 LIST
//             Expanded(
//               child: notes.isEmpty
//                   ? const Center(child: Text("No notes yet"))
//                   : ListView.builder(
//                       itemCount: notes.length,
//                       itemBuilder: (context, index) {

//                         return Card(
//                           margin: const EdgeInsets.only(bottom: 10),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(12),
//                           ),

//                           child: ListTile(
//                             title: Text(notes[index]),

//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [

//                                 IconButton(
//                                   icon: const Icon(Icons.edit, color: Colors.orange),
//                                   onPressed: () => editNote(index),
//                                 ),

//                                 IconButton(
//                                   icon: const Icon(Icons.delete, color: Colors.red),
//                                   onPressed: () => deleteNote(index),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }