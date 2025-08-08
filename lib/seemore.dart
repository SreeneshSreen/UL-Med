import 'package:flutter/material.dart';

class Seemore extends StatefulWidget {
  const Seemore({super.key});

  @override
  State<Seemore> createState() => _SeemoreState();
}

class _SeemoreState extends State<Seemore> {
  String selected = "All"; // default selected button

  final List<String> filters = ["All", "Newest", "Popular", "Best sellers"];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50, // height of filter bar
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((label) {
            return _buildFilterButton(label);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    bool isSelected = selected == label;
    bool isBestSellers = label == "Best sellers";

    return GestureDetector(
      onTap: () {
        setState(() {
          selected = label;
        });
      },
      child: Container(
        height: 40,
        width: isBestSellers ? 150 : 90, // Wider for "Best sellers"
        margin: const EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          color: isSelected ? Colors.pink : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade400, width: 1),
        ),
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
