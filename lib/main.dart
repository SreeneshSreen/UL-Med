import 'package:flutter/material.dart';
import 'package:ulmed/categories.dart';
import 'package:ulmed/customappbar.dart';
import 'package:ulmed/searchbar.dart';
import 'package:ulmed/imagescroll.dart';
import 'package:ulmed/recommended.dart';
import 'package:ulmed/seemore.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
    );
  }
}

/// 🔹 MainScreen handles tab switching
class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const MyHomePage(title: 'Urban Looms'),
    const Center(child: Text("Wishlist Page")),
    const Center(child: Text("Notifications Page")),
    const Center(child: Text("Account Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return InkWell(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: isSelected ? Colors.pink : Colors.grey),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.pink : Colors.grey,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        elevation: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home, "Home", 0),
              _buildNavItem(Icons.favorite, "Wishlist", 1),
              _buildNavItem(Icons.notifications, "Notification", 2),
              _buildNavItem(Icons.person, "Account", 3),
            ],
          ),
        ),
      ),
    );
  }
}

/// 🔹 Your existing home page
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          // 🔹 Fixed search bar
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: const [Expanded(child: BlinkingHintTextSearchBar())],
            ),
          ),

          // 🔹 Scrollable content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const SizedBox(height: 160, child: ImageScroll()),
                  const SizedBox(height: 20),
                  Row(
                    children: const [
                      Icon(
                        Icons.category,
                        size: 20,
                        color: Color.fromARGB(255, 216, 18, 110),
                      ),
                      SizedBox(width: 5),
                      Text("Categories"),
                    ],
                  ),
                  CategoriesGrid(),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Row(
                        children: [
                          Icon(
                            Icons.thumb_up,
                            size: 20,
                            color: Color.fromARGB(255, 216, 18, 110),
                          ),
                          SizedBox(width: 5),
                          Text("Recommended"),
                        ],
                      ),
                      Text(
                        "See more",
                        style: TextStyle(
                          color: Color.fromARGB(255, 216, 18, 110),
                        ),
                      ),
                    ],
                  ),
                  Recommended(),
                  Seemore(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
