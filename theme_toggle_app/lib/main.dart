import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isDarkMode = false;

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData.light(),

      darkTheme: ThemeData.dark(),

      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,

      home: HomeScreen(
        isDarkMode: isDarkMode,
        toggleTheme: toggleTheme,
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.toggleTheme,
  });

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Theme Switch"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            AnimatedContainer(
              duration: const Duration(milliseconds: 400),
              padding: const EdgeInsets.all(25),
              margin: const EdgeInsets.symmetric(horizontal: 30),

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                  )
                ],
              ),

              child: Column(
                children: [

                  Icon(
                    isDarkMode ? Icons.dark_mode : Icons.light_mode,
                    size: 70,
                    color: isDarkMode ? Colors.amber : Colors.orange,
                  ),

                  const SizedBox(height: 20),

                  Text(
                    isDarkMode
                        ? "Dark Mode Enabled"
                        : "Light Mode Enabled",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 30),

                  SwitchListTile(
                    title: const Text(
                      "Toggle Theme",
                      style: TextStyle(fontSize: 16),
                    ),

                    value: isDarkMode,

                    onChanged: (value) {
                      toggleTheme();
                    },

                    secondary: Icon(
                      isDarkMode
                          ? Icons.nightlight_round
                          : Icons.wb_sunny,
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}