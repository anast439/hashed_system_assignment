import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/screens/home/components/auto_scroll_banner.dart';
import 'package:hashed_system_assignment/screens/home/home_screen.dart';
import 'package:hashed_system_assignment/screens/home/widgets/category_chip.dart';
import 'package:hashed_system_assignment/screens/home/widgets/date_chip.dart';
import 'package:hashed_system_assignment/screens/home/widgets/deal_card.dart';
import 'package:hashed_system_assignment/screens/home/widgets/discount_chip.dart';
import 'package:hashed_system_assignment/screens/home/widgets/horizontal_list.dart';
import 'package:hashed_system_assignment/screens/home/widgets/partner_logo.dart';
import 'package:hashed_system_assignment/widgets/heading_label_text_widget.dart';

class BodySection extends StatelessWidget {
  const BodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: AppSizes.spaceBtwSections),
        const HeadingLabelTexWidget(title: 'Filter By Category'),
        SizedBox(height: AppSizes.spaceBtwItems),
        HorizontalList(
          height: 110,
          itemBuilder: (index) =>
               CategoryChip(imagePath: AppAssets.dining1, label: 'Dining'),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),

        _dividerWithHeading('Filter By Discount'),

        HorizontalList(
          height: 50,
          itemBuilder: (index) => const DiscountChip(label: 'Up to 10%'),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),

        _dividerWithHeading('Upcoming Deal'),
        HorizontalList(
          height: 110,
          itemBuilder: (index) => const DateChip(label: '25', isToday: true),
        ),

        SizedBox(height: AppSizes.spaceBtwItems / 2),
        const AutoScrollBanner(),
        SizedBox(height: AppSizes.spaceBtwItems),

        HeadingLabelTexWidget(title: 'Deal of the day'),
        SizedBox(height: AppSizes.spaceBtwItems),

        HorizontalList(height: 300, itemBuilder: (index) => const DealCard()),
        SizedBox(height: AppSizes.spaceBtwItems),

        HeadingLabelTexWidget(title: 'Our Partners'),
        SizedBox(height: AppSizes.spaceBtwItems),

        HorizontalList(
          height: 110,
          itemBuilder: (index) => const PartnerLogo(AppAssets.brand),
        ),
        SizedBox(height: AppSizes.spaceBtwItems),

        HorizontalList(
          height: 110,
          itemBuilder: (index) => const PartnerLogo(AppAssets.brand2),
        ),
      ],
    );
  }

  Widget _dividerWithHeading(String title) => Column(
    children: [
      const Divider(color: Color(0xffE9E9E9)),
      SizedBox(height: AppSizes.spaceBtwItems),
      HeadingLabelTexWidget(title: title),
      SizedBox(height: AppSizes.spaceBtwItems),
    ],
  );
}
