import 'dart:async';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double progress = 0.0;
  bool isDownloading = false;

  void startDownload() {
    setState(() {
      progress = 0;
      isDownloading = true;
    });

    Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        progress += 0.02;
      });

      if (progress >= 1) {
        timer.cancel();
        setState(() {
          isDownloading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Download Complete"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],

      appBar: AppBar(
        title: Text("Download Progress"),
        centerTitle: true,
      ),

      body: Center(
        child: Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(25),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 10)
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.download, size: 60, color: Colors.indigo),

              SizedBox(height: 20),

              Text(
                "File Download",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 20),

              // 🔵 Progress Bar
              LinearProgressIndicator(
                value: progress,
                minHeight: 10,
                borderRadius: BorderRadius.circular(10),
              ),

              SizedBox(height: 15),

              // 📊 Percentage
              Text(
                "${(progress * 100).toInt()}%",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 25),

              ElevatedButton(
                onPressed: isDownloading ? null : startDownload,
                child: Text("Start Download"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: 25, vertical: 12),
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