import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final bool isGradiant;

  const CustomButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isGradiant = false,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        decoration: BoxDecoration(
          color: AppColors.primary,

          gradient: isGradiant ? AppColors.primaryGradient : null,
          borderRadius: BorderRadius.circular(10.0),
        ),
        width: width,
        height: 50,
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
