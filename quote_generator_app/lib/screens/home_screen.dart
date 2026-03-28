import 'dart:math';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final List<String> quotes = [
    "Success is not final, failure is not fatal.",
    "Dream big and dare to fail.",
    "Stay hungry, stay foolish.",
    "Believe you can and you're halfway there.",
    "Push yourself, because no one else will.",
    "Great things never come from comfort zones.",
    "Do something today that your future self will thank you for.",
    "Don’t watch the clock; do what it does. Keep going.",
    "Everything you can imagine is real.",
    "Action is the foundational key to success.",
    "Hard work beats talent when talent doesn’t work hard.",
    "Opportunities don’t happen, you create them.",
    "Stay positive, work hard, make it happen.",
    "Don’t limit your challenges, challenge your limits.",
    "Success doesn’t come to you, you go to it.",
    "Be stronger than your excuses.",
    "Work hard in silence, let success make the noise.",
    "Dream it. Wish it. Do it.",
    "Success is what comes after you stop making excuses.",
    "Don’t stop until you’re proud.",
    "The harder you work, the luckier you get.",
    "Small steps every day.",
    "Make today count.",
    "You are capable of amazing things.",
    "Never give up.",
    "Focus on your goals.",
    "Stay consistent.",
    "Create your own future.",
    "Be fearless.",
    "Progress over perfection.",
    "Turn your dreams into plans.",
    "Work smart and hard.",
    "Discipline equals freedom.",
    "Keep moving forward.",
    "You got this.",
    "Start now.",
    "No excuses.",
    "Think big.",
    "Act now.",
    "Stay motivated.",
  ];

  String currentQuote = "Click button to generate quote";

  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    // Animation Controller
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );

    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
  }

  void generateQuote() {
    final random = Random();
    setState(() {
      currentQuote = quotes[random.nextInt(quotes.length)];
    });

    // Restart animation
    _controller.forward(from: 0);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // 🌈 Gradient Background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.indigo, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 📦 Card UI
                ScaleTransition(
                  scale: _animation,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black26, blurRadius: 10),
                      ],
                    ),
                    child: Text(
                      currentQuote,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 40),

                // 🔘 Button
                ElevatedButton(
                  onPressed: generateQuote,
                  child: Text("Generate Quote"),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
