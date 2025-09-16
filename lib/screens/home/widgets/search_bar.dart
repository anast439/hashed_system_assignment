import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/sizes.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
        border: Border.all(
          color: AppColors.textFieldBorderColor.withValues(alpha: 0.1),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          const Icon(Icons.search),
          SizedBox(width: AppSizes.spaceBtwItems / 2),
          const Text('Search...'),
        ],
      ),
    );
  }
}
