import 'package:flutter/material.dart';

class CategoriesGrid extends StatelessWidget {
  const CategoriesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'icon': Icons.bed, 'label': 'Home Linen'},
      {'icon': Icons.checkroom, 'label': 'Apparel'},
      {'icon': Icons.light, 'label': 'Decor'},
      {'icon': Icons.kitchen, 'label': 'Kitchenware'},
      {'icon': Icons.shopping_bag, 'label': 'Accessories'},
      {'icon': Icons.eco, 'label': 'Eco Living'},
      {'icon': Icons.spa, 'label': 'Wellness'},
      {'icon': Icons.more_horiz_outlined, 'label': 'More'},
    ];

    return Container(
      padding: const EdgeInsets.all(3), // gradient border thickness
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //   colors: [
        //     Color(0xFFE96443),
        //     Color(0xFF904E95),
        //   ], // vivid orange → purple
        //   begin: Alignment.topLeft,
        //   end: Alignment.bottomRight,
        // ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: categories.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            mainAxisSpacing: 4,
            crossAxisSpacing: 8,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            final category = categories[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                    child: Icon(
                      category['icon'],
                      size: 30,
                      color: const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    category['label'],
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
