import 'package:flutter/material.dart';
import 'package:ulmed/categories.dart';
import 'package:ulmed/customappbar.dart';
import 'package:ulmed/searchbar.dart';
import 'package:ulmed/imagescroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Urban Looms'),
    );
  }
}

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
                  // RecommendedGrid(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
