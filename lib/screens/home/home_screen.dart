import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/padding.dart';
import 'package:hashed_system_assignment/screens/home/components/body_section.dart';
import 'package:hashed_system_assignment/screens/home/components/header_section.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: AppColors.cardBackGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// --- Header Section --- ///
            HeaderSection(width: width),

            /// --- Body Section --- ///
            Container(
              width: width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Padding(
                padding: UPadding.screenPadding,
                child: const BodySection(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
