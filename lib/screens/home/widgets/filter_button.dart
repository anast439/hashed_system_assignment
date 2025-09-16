import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:icons_plus/icons_plus.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: const Icon(Iconsax.filter_bold, color: Colors.white),
    );
  }
}
