import 'package:flutter/material.dart';

class BottomBarActiveIconWidget extends StatelessWidget {
  final IconData icon;

  const BottomBarActiveIconWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: Colors.white);
  }
}
