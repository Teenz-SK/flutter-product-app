import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/note_model.dart';

class StorageService {
  static const key = "notes";

  static Future<void> saveNotes(List<Note> notes) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(
      key,
      json.encode(notes.map((e) => e.toJson()).toList()),
    );
  }

  static Future<List<Note>> loadNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(key);

    if (data == null) return [];

    final List decoded = json.decode(data);
    return decoded.map((e) => Note.fromJson(e)).toList();
  }
}