import 'package:flutter/material.dart';

class MyBottomBarWidget extends StatelessWidget {
  const MyBottomBarWidget({
    super.key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.selectedItemGradient,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const RoundedRectangleBorder(),
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  });

  final List<MyBottomBarItem> items;

  final int currentIndex;

  final Function(int)? onTap;

  final Color? backgroundColor;

  final Color? selectedItemColor;

  final Gradient? selectedItemGradient;

  final Color? unselectedItemColor;

  final double? selectedColorOpacity;

  final ShapeBorder itemShape;

  final EdgeInsets margin;

  final EdgeInsets itemPadding;

  final Duration duration;

  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: 0.5,
      color: Colors.white,
      child: SafeArea(
        minimum: margin,
        child: Row(
          mainAxisAlignment: items.length <= 2
              ? MainAxisAlignment.spaceEvenly
              : MainAxisAlignment.spaceBetween,
          children: [
            for (final item in items)
              TweenAnimationBuilder<double>(
                tween: Tween(
                  end: items.indexOf(item) == currentIndex ? 1.0 : 0.0,
                ),
                curve: curve,
                duration: duration,
                builder: (context, t, _) {
                  final selectedColor =
                      item.selectedColor ??
                      selectedItemColor ??
                      theme.primaryColor;

                  final unselectedColor =
                      item.unselectedColor ??
                      unselectedItemColor ??
                      theme.iconTheme.color;

                  final selectedGradient =
                      item.selectedGradient ?? selectedItemGradient;

                  return Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),

                    child: InkWell(
                      onTap: () => onTap?.call(items.indexOf(item)),
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: t > 0 && selectedGradient != null
                              ? selectedGradient
                              : null,
                          color: selectedGradient == null
                              ? Color.lerp(
                                  selectedColor.withValues(alpha: 0.0),
                                  selectedColor.withValues(
                                    alpha: selectedColorOpacity ?? 0.1,
                                  ),
                                  t,
                                )
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding:
                            itemPadding -
                            (Directionality.of(context) == TextDirection.ltr
                                ? EdgeInsets.only(right: itemPadding.right * t)
                                : EdgeInsets.only(left: itemPadding.left * t)),
                        child: Row(
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(
                                  unselectedColor,
                                  selectedColor,
                                  t,
                                ),
                                size: 24,
                              ),
                              child: items.indexOf(item) == currentIndex
                                  ? item.activeIcon ?? item.icon
                                  : item.icon,
                            ),
                            ClipRect(
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 25,
                                child: Align(
                                  alignment: const Alignment(-0.2, 0.0),
                                  widthFactor: t,
                                  child: Padding(
                                    padding:
                                        Directionality.of(context) ==
                                            TextDirection.ltr
                                        ? EdgeInsets.only(
                                            left: itemPadding.left / 2,
                                            right: itemPadding.right,
                                          )
                                        : EdgeInsets.only(
                                            left: itemPadding.left,
                                            right: itemPadding.right / 2,
                                          ),
                                    child: DefaultTextStyle(
                                      style: TextStyle(
                                        color: Color.lerp(
                                          selectedColor.withValues(alpha: 0.0),
                                          selectedColor,
                                          t,
                                        ),
                                        fontWeight: FontWeight.w600,
                                      ),
                                      child: item.title,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}

class MyBottomBarItem {
  final Widget icon;

  final Widget? activeIcon;

  final Widget title;

  final Color? selectedColor;

  final Color? unselectedColor;

  final Gradient? selectedGradient;

  MyBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
    this.selectedGradient,
  });
}
