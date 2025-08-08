import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight + 20),
      child: ClipPath(
        clipper: BottomRoundedClipper(),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 216, 18, 110),
                Color.fromRGBO(248, 100, 186, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SafeArea(
            child: Row(
              children: [
                const Text(
                  'Urban Looms..',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.home, color: Colors.white),
                  tooltip: 'Home',
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.person, color: Colors.white),
                  tooltip: 'Profile',
                ),
                // IconButton(
                //   onPressed: () {},
                //   icon: const Icon(Icons.notifications, color: Colors.white),
                //   tooltip: 'Notifications',
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}

/// 🟣 Custom Clipper for Upward Curved Bottom Corners
class BottomRoundedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const double curveHeight = 30;

    Path path = Path();
    path.lineTo(0, size.height - curveHeight);
    path.quadraticBezierTo(
      0,
      size.height,
      curveHeight,
      size.height,
    ); // Bottom left curve
    path.lineTo(size.width - curveHeight, size.height);
    path.quadraticBezierTo(
      size.width,
      size.height,
      size.width,
      size.height - curveHeight,
    ); // Bottom right curve
    path.lineTo(size.width, 0); // Top right
    path.close(); // Top left
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
