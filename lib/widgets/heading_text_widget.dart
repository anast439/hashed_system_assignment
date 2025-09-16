import 'package:flutter/material.dart';

class HeadingLabelTexWidget extends StatelessWidget {
  final String title;
  const HeadingLabelTexWidget({
    super.key, required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }
}
