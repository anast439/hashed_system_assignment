import 'package:flutter/material.dart';

class HeadingLabelTexWidget extends StatelessWidget {
  final String title;
  final AlignmentGeometry alignment;

  const HeadingLabelTexWidget({
    super.key,
    required this.title,
    this.alignment = Alignment.centerLeft,
  });

  @override
  Widget build(BuildContext context) => Align(
    alignment: alignment,

    child: Text(title, style: Theme.of(context).textTheme.titleMedium),
  );
}
