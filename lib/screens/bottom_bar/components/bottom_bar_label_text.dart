import 'package:flutter/material.dart';

class BottomBarLabelTextWidget extends StatelessWidget {
  final String label;

  const BottomBarLabelTextWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
