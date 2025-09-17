import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/sizes.dart';

class CategoryChip extends StatelessWidget {
  final String imagePath;
  final String label;

  const CategoryChip({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 35,
          backgroundColor: AppColors.cardBackGroundColor,
          child: Image.asset(imagePath, width: 46, height: 46),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),
        Text(label, style: Theme.of(context).textTheme.bodyMedium),
      ],
    );
  }
}
