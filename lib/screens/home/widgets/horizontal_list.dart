import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final int itemCount;
  final double height;
  final Widget Function(int) itemBuilder;

  const HorizontalList({
    super.key,
    required this.height,
    this.itemCount = 10,
    required this.itemBuilder,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemBuilder: (context, index) => itemBuilder(index),
      ),
    );
  }
}
