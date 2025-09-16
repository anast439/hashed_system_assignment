import 'package:flutter/material.dart';

class PartnerLogo extends StatelessWidget {
  final String image;

  const PartnerLogo(this.image, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xffDBDBDB)),
      ),
      child: Image.asset(image),
    );
  }
}
