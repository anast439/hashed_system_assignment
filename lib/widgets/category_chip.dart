import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/sizes.dart';

class CategoryChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const CategoryChip({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            shape: BoxShape.circle,
          ),
          child: Icon(icon, color: const Color(0xFF00A676)),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
