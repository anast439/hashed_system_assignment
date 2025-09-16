import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/core/sizes.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class AutoScrollBanner extends StatefulWidget {
  const AutoScrollBanner({
    super.key,
    this.autoScrollInterval = const Duration(seconds: 3),
    this.scrollDuration = const Duration(milliseconds: 400),
    this.height = 200,
    this.images,
  });

  /// Time between auto scrolls
  final Duration autoScrollInterval;

  /// Animation duration for page change
  final Duration scrollDuration;

  /// Height of the banner
  final double height;

  /// Image list (default: sample picsum)
  final List<String>? images;

  @override
  State<AutoScrollBanner> createState() => _AutoScrollBannerState();
}

class _AutoScrollBannerState extends State<AutoScrollBanner> {
  late final PageController _pageController;
  late final List<String> _images;
  Timer? _timer;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _images =
        widget.images ??
        [
          "https://picsum.photos/id/1011/400/200",
          "https://picsum.photos/id/1015/400/200",
          "https://picsum.photos/id/1020/400/200",
        ];
    _pageController = PageController();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(widget.autoScrollInterval, (_) {
      final nextPage = (_currentPage + 1) % _images.length;
      _pageController.animateToPage(
        nextPage,
        duration: widget.scrollDuration,
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: widget.height,
          child: PageView.builder(
            controller: _pageController,
            itemCount: _images.length,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: FadeInImage.assetNetwork(
                  placeholder: "assets/images/placeholder.png",
                  image: _images[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: AppSizes.spaceBtwItems),
        SmoothPageIndicator(
          controller: _pageController,
          count: _images.length,
          effect: const ExpandingDotsEffect(
            dotHeight: 8,
            dotWidth: 8,
            activeDotColor: AppColors.primary,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
