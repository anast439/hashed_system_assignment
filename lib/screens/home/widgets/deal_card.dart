import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_assets.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:icons_plus/icons_plus.dart';

class DealCard extends StatelessWidget {
  const DealCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 265,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade200,
      ),
      child: Stack(
        children: [
          /// Top Image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              AppAssets.ristorante,
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),

          /// Discount Badge
          Positioned(
            top: 10,
            left: 15,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(color: Colors.white, width: 1.0),
              ),
              child: const Text(
                '30% off',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),

          /// Heart Icon
          const Positioned(
            top: 10,
            right: 15,
            child: Icon(Iconsax.heart_outline, color: Colors.white),
          ),

          /// Bottom Info
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(10),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Ristorante – Niko Romito',
                    style: Theme.of(context).textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Dine and enjoy a 20% Discount',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: const Color(0xffA3A7AC),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Divider(color: Colors.grey.shade300),
                  Row(
                    children: [
                      const Icon(Iconsax.location_outline, size: 16),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'Ristorante L’Olivo at Al Mah...',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: const Color(0xffA3A7AC)),
                            children: [
                              TextSpan(
                                text: ' +5 more',
                                style: TextStyle(color: AppColors.primary),
                              ),
                            ],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSizes.spaceBtwItems),
                  Row(
                    children: [
                      Text(
                        '5.0 ',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: const Color(0xffA3A7AC),
                        ),
                      ),
                      const Icon(
                        Icons.star,
                        size: 16,
                        color: AppColors.primary,
                      ),
                      const SizedBox(width: 6),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '(7 reviews)',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: const Color(0xffA3A7AC)),
                            ),

                            Text(
                              'Sold: 7350',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(color: const Color(0xffA3A7AC)),
                            ),
                          ],
                        ),
                        // child: Text.rich(
                        //   TextSpan(
                        //     text: '(7 reviews)',
                        //     style: Theme.of(context).textTheme.bodyMedium!
                        //         .copyWith(color: const Color(0xffA3A7AC)),
                        //     children: [
                        //       TextSpan(
                        //         text: ' +5 more',
                        //         style: TextStyle(color: AppColors.primary),
                        //       ),
                        //     ],
                        //   ),
                        //   overflow: TextOverflow.ellipsis,
                        // ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
