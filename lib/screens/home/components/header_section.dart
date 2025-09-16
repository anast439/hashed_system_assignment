import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/padding.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/screens/home/widgets/cart_icon.dart';
import 'package:hashed_system_assignment/screens/home/widgets/filter_button.dart';
import 'package:hashed_system_assignment/screens/home/widgets/search_bar.dart';

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: UPadding.screenPadding,
      decoration: BoxDecoration(color: AppColors.cardBackGroundColor),
      child: Column(
        children: [
          SizedBox(height: AppSizes.appBarHeight),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'UAE',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xff101928),
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
              Image.asset(AppAssets.logo, width: 100, height: 30),
              const CartIcon(),
            ],
          ),

          /// Search + Filter
          SizedBox(height: AppSizes.spaceBtwSections),
          Row(
            children: [
              Expanded(child: SearchBarWidget(width: width)),
              SizedBox(width: AppSizes.spaceBtwItems),
              FilterButton(),
            ],
          ),
        ],
      ),
    );
  }
}
