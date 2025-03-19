import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CategoryScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  CategoryScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("E-Shop"),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: toggleTheme,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/coming_soon.json', height: 200),
          SizedBox(height: 20),
          Text(
            "Category Coming Soon",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "We're building an amazing category experience for you to explore products!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
