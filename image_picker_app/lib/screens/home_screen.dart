import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? _image;

  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final picked = await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("No image selected"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("Image Picker"),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(20),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
              )
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _image != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.file(
                        _image!,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Column(
                      children: [
                        Icon(Icons.image, size: 80, color: Colors.grey),
                        SizedBox(height: 10),
                        Text(
                          "No Image Selected",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),

              SizedBox(height: 25),

              ElevatedButton.icon(
                onPressed: pickImage,
                icon: Icon(Icons.photo),
                label: Text("Select Image"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}