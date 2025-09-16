import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';

class DateChip extends StatelessWidget {
  final String label;
  final String? month;
  final bool isToday;

  const DateChip({
    super.key,
    required this.label,
    this.month,
    this.isToday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isToday ? Color(0xffD5F4ED) : Color(0xff628A79),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.primary),
          ),
          child: Column(
            children: [
              Text(
                label,
                style: Theme.of(
                  context,
                ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'Today',
                style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: isToday ? Colors.black : Color(0xff628A79),
                ),
              ),
            ],
          ),
        ),
        if (month != null) Text(month!, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
