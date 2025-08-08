import 'package:flutter/material.dart';

class RecommendedGrid extends StatelessWidget {
  const RecommendedGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> recommendedItems = [
      {
        'image': 'https://via.placeholder.com/150', // replace with real image
        'label': 'Cotton Bedsheet',
        'price': '\$25.00',
      },
      {
        'image': 'https://via.placeholder.com/150',
        'label': 'Ceramic Vase',
        'price': '\$15.00',
      },
      {
        'image': 'https://via.placeholder.com/150',
        'label': 'Wooden Chair',
        'price': '\$85.00',
      },
      {
        'image': 'https://via.placeholder.com/150',
        'label': 'Table Lamp',
        'price': '\$45.00',
      },
    ];

    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: recommendedItems.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 per row for larger items
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.75, // taller cards
      ),
      itemBuilder: (context, index) {
        final item = recommendedItems[index];
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(8),
                ),
                child: Image.network(
                  item['image'],
                  height: 100,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  item['label'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  item['price'],
                  style: const TextStyle(
                    color: Color.fromARGB(255, 216, 18, 110),
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
