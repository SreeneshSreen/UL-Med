import 'package:flutter/material.dart';
import 'dart:async';

class BlinkingHintTextSearchBar extends StatefulWidget {
  const BlinkingHintTextSearchBar({super.key});

  @override
  State<BlinkingHintTextSearchBar> createState() =>
      _BlinkingHintTextSearchBarState();
}

class _BlinkingHintTextSearchBarState extends State<BlinkingHintTextSearchBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacityAnimation;

  final List<String> _hints = [
    "Men's Uniforms",
    "Women's Uniforms",
    "Scrub Suits",
    "Doctor Coats",
    "Medical Aprons",
    "Surgical Wear",
  ];
  int _currentHintIndex = 0;
  Timer? _hintTimer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);

    _opacityAnimation = Tween<double>(
      begin: 1.0,
      end: 0.3,
    ).animate(_controller);

    _hintTimer = Timer.periodic(const Duration(seconds: 2), (timer) {
      setState(() {
        _currentHintIndex = (_currentHintIndex + 1) % _hints.length;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _hintTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(30),
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            TextField(
              style: const TextStyle(fontSize: 14),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: const Icon(Icons.search),
                hintText: "", // handled manually
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
              ),
            ),
            Positioned(
              left: 50,
              child: FadeTransition(
                opacity: _opacityAnimation,
                child: Text(
                  _hints[_currentHintIndex],
                  style: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
