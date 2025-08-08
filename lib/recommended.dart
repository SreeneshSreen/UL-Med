import 'package:flutter/material.dart';

class Recommended extends StatelessWidget {
  const Recommended({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          height: 150, // height of section
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: const Color.fromARGB(255, 222, 222, 222),
                ),
                width: 150,
                height: 200,
                // color: const Color.fromARGB(255, 137, 137, 137),
                child: const Center(child: Text("Item 1")),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 225, 222),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 150,
                height: 200,
                child: const Center(child: Text("Item 2")),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 150, // height of section
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: const Color.fromARGB(255, 222, 222, 222),
                ),
                width: 150,
                height: 200,
                // color: const Color.fromARGB(255, 137, 137, 137),
                child: const Center(child: Text("Item 1")),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 225, 222),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 150,
                height: 200,
                child: const Center(child: Text("Item 2")),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          height: 150, // height of section
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5),
                  color: const Color.fromARGB(255, 222, 222, 222),
                ),
                width: 150,
                height: 200,
                // color: const Color.fromARGB(255, 137, 137, 137),
                child: const Center(child: Text("Item 1")),
              ),
              const SizedBox(width: 10),
              Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 222, 225, 222),
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 150,
                height: 200,
                child: const Center(child: Text("Item 2")),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
