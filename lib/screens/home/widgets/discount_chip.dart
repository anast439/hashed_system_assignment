import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';

class DiscountChip extends StatelessWidget {
  final String label;

  const DiscountChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.primary),
        borderRadius: BorderRadius.circular(10),
      ),
      label: Text(
        label,
        style: Theme.of(
          context,
        ).textTheme.bodyLarge!.copyWith(color: const Color(0xff628A79)),
      ),
    );
  }
}
