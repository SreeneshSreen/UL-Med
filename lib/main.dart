import 'package:flutter/material.dart';
import 'package:ulmed/categories.dart';
import 'package:ulmed/customappbar.dart';
import 'package:ulmed/searchbar.dart'; // make sure path is correct
import 'package:ulmed/imagescroll.dart'; // Update this path if needed

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
      // backgroundColor: Colors.amberAccent,
      // ✅ Use custom AppBar directly
      appBar: const CustomAppBar(),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(children: const [Expanded(child: BlinkingHintTextSearchBar())]),
            SizedBox(height: 20),
            // CategoriesRow(),
            const SizedBox(
              height: 70, // or whatever fits your images
              child: CategoriesRow(),
            ),

            // SizedBox(height: 1),
            const SizedBox(
              height: 160, // or whatever fits your images
              child: ImageScroll(),
            ),
          ],
        ),
      ),
    );
  }
}
