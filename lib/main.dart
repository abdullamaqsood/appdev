import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/product_bloc.dart';
import 'bloc/product_event.dart';
import 'screens/home_screen.dart';
import 'screens/category_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false; // Global dark mode state

  void _toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductBloc()..add(FetchProducts()),
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light, // Apply dark mode globally
        home: MainScreen(
          isDarkMode: isDarkMode,
          toggleTheme: _toggleTheme,
        ),
      ),
    );
  }
}

class MainScreen extends StatefulWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  MainScreen({required this.isDarkMode, required this.toggleTheme});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      HomeScreen(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
      CategoryScreen(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
      ProfileScreen(isDarkMode: widget.isDarkMode, toggleTheme: widget.toggleTheme),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Only one screen is displayed at a time
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
