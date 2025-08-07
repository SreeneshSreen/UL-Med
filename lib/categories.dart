import 'package:flutter/material.dart';

class CategoriesRow extends StatelessWidget {
  const CategoriesRow({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {
        'icon': Icons.bed,
        //  'label': 'Home Linen'
      },
      {
        'icon': Icons.checkroom,
        // 'label': 'Apparel'
      },
      {
        'icon': Icons.light,
        // 'label': 'Decor'
      },
      {
        'icon': Icons.kitchen,
        //  'label': 'Kitchenware'
      },
      {
        'icon': Icons.shopping_bag,
        //  'label': 'Accessories'
      },
      // {
      //   'icon': Icons.eco,
      //   // 'label': 'Eco Living'
      // },
    ];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories.map((category) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundColor: Color.fromRGBO(217, 167, 233, 1),
                  child: Icon(
                    category['icon'],
                    size: 25,
                    color: Color.fromARGB(255, 122, 10, 187),
                  ),
                ),
                const SizedBox(height: 8),
                // Text(
                //   category['label'],
                //   style: const TextStyle(fontSize: 12),
                //   textAlign: TextAlign.center,
                // ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
