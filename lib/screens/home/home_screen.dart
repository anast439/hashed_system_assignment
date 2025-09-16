// lib/screens/home/home_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/padding.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/screens/home/components/body_section.dart';
import 'package:hashed_system_assignment/screens/home/components/header_section.dart';
import 'package:icons_plus/icons_plus.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: AppColors.cardBackGroundColor,
      body: Stack(
        children: [
          /// --- Header Section --- ///
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HeaderSection(width: width),
          ),

          /// --- Body Section --- ///
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * .6,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: SingleChildScrollView(
                padding: UPadding.screenPadding,
                child: const BodySection(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
