import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/widgets/custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
    this.obscure = false,
  });

  final TextEditingController controller;
  final String label;
  final String hintText;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: AppSizes.spaceBtwItems),
        CustomTextField(
          obscure: obscure,
          controller: controller,
          hint: hintText,
        ),
      ],
    );
  }
}
