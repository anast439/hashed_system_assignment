import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';

class DiscountChip extends StatelessWidget {
  final String label;

  const DiscountChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.primary),
      ),
      child: Center(
        child: Text(
          label,
          style: Theme.of(
            context,
          ).textTheme.bodyLarge!.copyWith(color: Color(0xff628A79)),
        ),
      ),
    );
  }
}
