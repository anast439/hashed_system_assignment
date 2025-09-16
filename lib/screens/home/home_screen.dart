import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/padding.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:hashed_system_assignment/screens/home/components/auto_scroll_banner.dart';
import 'package:hashed_system_assignment/widgets/category_chip.dart';
import 'package:hashed_system_assignment/widgets/date_chip.dart';
import 'package:hashed_system_assignment/widgets/discount_chip.dart';
import 'package:hashed_system_assignment/widgets/heading_text_widget.dart';
import 'package:hashed_system_assignment/widgets/partners_logo_widget.dart';
import 'package:icons_plus/icons_plus.dart';

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
            child: Container(
              padding: UPadding.screenPadding,
              width: width,

              // height: 350,
              decoration: BoxDecoration(color: AppColors.cardBackGroundColor),
              child: Column(
                children: [
                  SizedBox(height: AppSizes.appBarHeight),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'UAE',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(
                                  color: Color(0xff101928),
                                  fontWeight: FontWeight.w800,
                                ),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),

                      Image.asset(AppAssets.logo, width: 100, height: 30),

                      Stack(
                        children: [
                          Icon(
                            Icons.shopping_cart,
                            size: 25,
                            color: Color(0xff2B675E),
                          ),
                          Positioned(
                            right: 0,
                            top: 0,
                            child: Container(
                              width: 15,
                              height: 15,
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: const Center(
                                child: FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Text(
                                    '03',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// ----  Search Bar and Filter Button ---- ----
                  SizedBox(height: AppSizes.spaceBtwSections),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          width: width,
                          height: 55,
                          decoration: BoxDecoration(
                            color: Colors.white,

                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: AppColors.textFieldBorderColor.withValues(
                                alpha: 0.1,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              children: [
                                Icon(Icons.search),
                                SizedBox(width: AppSizes.spaceBtwItems / 2),
                                Text('Search...'),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: AppSizes.spaceBtwItems),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          gradient: AppColors.primaryGradient,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Center(
                          child: Icon(Iconsax.filter_bold, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          /// --- Body Section --- ///
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * .6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              child: Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: UPadding.screenPadding,
                    child: Column(
                      children: [
                        SizedBox(height: AppSizes.spaceBtwSections),
                        // Filter by Category
                        HeadingLabelTexWidget(title: 'Filter By Category'),
                        SizedBox(height: AppSizes.spaceBtwItems),
                        SizedBox(
                          height: 110,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: CategoryChip(
                                  icon: Icons.restaurant,
                                  label: 'Dining',
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: AppSizes.spaceBtwItems),

                        // Filter by Discount
                        Divider(color: Color(0xffE9E9E9)),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        HeadingLabelTexWidget(title: 'Filter By Discount'),
                        SizedBox(height: AppSizes.spaceBtwItems),
                        SizedBox(
                          height: 50,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: DiscountChip(label: 'Up to 10%'),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: AppSizes.spaceBtwSections),

                        // Filter by Discount
                        Divider(color: Color(0xffE9E9E9)),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        HeadingLabelTexWidget(title: 'Upcoming Deal'),
                        SizedBox(height: AppSizes.spaceBtwItems),
                        SizedBox(
                          height: 110,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: DateChip(label: '25', isToday: true),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: AppSizes.spaceBtwItems / 2),

                        AutoScrollBanner(),

                        SizedBox(height: AppSizes.spaceBtwSections),
                        HeadingLabelTexWidget(title: 'Deal of the day'),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        SizedBox(
                          height: 256,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: Container(
                                  width: 265,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Stack(
                                    children: [
                                      // --- Background Image
                                      Container(
                                        height: 140,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10.0,
                                          ),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              AppAssets.ristorante,
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),

                                      // --- Discount Badge
                                      Positioned(
                                        top: 10,
                                        left: 15,
                                        child: Container(
                                          width: 80,
                                          height: 35,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.white,
                                              width: 2,
                                            ),
                                            borderRadius: BorderRadius.circular(
                                              20.0,
                                            ),
                                          ),
                                          child: Center(
                                            child: Text(
                                              '30% off',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelLarge!
                                                  .copyWith(
                                                    color: Colors.white,
                                                  ),
                                            ),
                                          ),
                                        ),
                                      ),

                                      // --- Heart Icon
                                      Positioned(
                                        top: 10,
                                        right: 15,
                                        child: Icon(
                                          Iconsax.heart_outline,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ),

                                      // --- Bottom Content
                                      Positioned(
                                        bottom: 0,
                                        left: 0,
                                        right: 0,
                                        // 👈 ye zaroori hai taake responsive bane
                                        child: Container(
                                          padding: const EdgeInsets.all(12),
                                          // thoda padding add
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                const BorderRadius.vertical(
                                                  bottom: Radius.circular(10),
                                                ),
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                'Ristorante – Niko Romito',
                                                style: Theme.of(
                                                  context,
                                                ).textTheme.titleMedium,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines:
                                                    1, // 👈 overflow handle
                                              ),
                                              const SizedBox(height: 4),
                                              Text(
                                                'Dine and enjoy a 20% Discount',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(
                                                      color: const Color(
                                                        0xffA3A7AC,
                                                      ),
                                                    ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 2,
                                              ),
                                              const SizedBox(height: 8),
                                              Divider(
                                                color: Colors.grey.shade300,
                                              ),
                                              const SizedBox(height: 8),
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Iconsax.location_outline,
                                                    size: 16,
                                                  ),
                                                  const SizedBox(width: 6),
                                                  Expanded(
                                                    child: RichText(
                                                      text: TextSpan(
                                                        children: [
                                                          TextSpan(
                                                            text:
                                                                'Ristorante L’Olivo at Al Mah...',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  color: const Color(
                                                                    0xffA3A7AC,
                                                                  ),
                                                                ),
                                                          ),
                                                          TextSpan(
                                                            text: '+5 more',
                                                            style: Theme.of(context)
                                                                .textTheme
                                                                .bodyMedium!
                                                                .copyWith(
                                                                  color: AppColors
                                                                      .primary,
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: AppSizes.spaceBtwSections),
                        HeadingLabelTexWidget(title: 'Our Partners'),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        SizedBox(
                          height: 110,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: PartnerLogo(AppAssets.brand),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: AppSizes.spaceBtwItems),

                        SizedBox(
                          height: 110,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                              10,
                              (index) => const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 12.0),
                                child: PartnerLogo(AppAssets.brand2),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
