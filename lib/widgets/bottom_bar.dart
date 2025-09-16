import 'package:flutter/material.dart';

class SalomonBottomBar extends StatelessWidget {
  SalomonBottomBar({
    Key? key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 0,
    this.onTap,
    this.selectedItemColor,
    this.selectedItemGradient,
    this.unselectedItemColor,
    this.selectedColorOpacity,
    this.itemShape = const RoundedRectangleBorder(

    ),
    this.margin = const EdgeInsets.all(8),
    this.itemPadding = const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
    this.duration = const Duration(milliseconds: 500),
    this.curve = Curves.easeOutQuint,
  }) : super(key: key);

  /// A list of tabs to display
  final List<SalomonBottomBarItem> items;

  /// The tab to display.
  final int currentIndex;

  /// Returns the index of the tab that was tapped.
  final Function(int)? onTap;

  /// The background color of the bar.
  final Color? backgroundColor;

  /// The color of the icon and text when the item is selected.
  final Color? selectedItemColor;

  /// The gradient of the item background when selected
  final Gradient? selectedItemGradient;

  /// The color of the icon and text when the item is not selected.
  final Color? unselectedItemColor;

  /// The opacity of color of the touchable background when the item is selected.
  final double? selectedColorOpacity;

  /// The border shape of each item.
  final ShapeBorder itemShape;

  /// Margin around the bar
  final EdgeInsets margin;

  /// Padding of each item
  final EdgeInsets itemPadding;

  /// Animation duration
  final Duration duration;

  /// Animation curve
  final Curve curve;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: backgroundColor ?? Colors.transparent,
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
                  final _selectedColor = item.selectedColor ??
                      selectedItemColor ??
                      theme.primaryColor;

                  final _unselectedColor = item.unselectedColor ??
                      unselectedItemColor ??
                      theme.iconTheme.color;

                  final _selectedGradient =
                      item.selectedGradient ?? selectedItemGradient;

                  return Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10.0),
                    // shape: itemShape,
                    child: InkWell(
                      onTap: () => onTap?.call(items.indexOf(item)),
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: t > 0 && _selectedGradient != null
                              ? _selectedGradient
                              : null,
                          color: _selectedGradient == null
                              ? Color.lerp(
                            _selectedColor.withOpacity(0.0),
                            _selectedColor
                                .withOpacity(selectedColorOpacity ?? 0.1),
                            t,
                          )
                              : null,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: itemPadding -
                            (Directionality.of(context) == TextDirection.ltr
                                ? EdgeInsets.only(right: itemPadding.right * t)
                                : EdgeInsets.only(left: itemPadding.left * t)),
                        child: Row(
                          children: [
                            IconTheme(
                              data: IconThemeData(
                                color: Color.lerp(
                                    _unselectedColor, _selectedColor, t),
                                size: 28,
                              ),
                              child: items.indexOf(item) == currentIndex
                                  ? item.activeIcon ?? item.icon
                                  : item.icon,
                            ),
                            ClipRect(
                              clipBehavior: Clip.antiAlias,
                              child: SizedBox(
                                height: 20,
                                child: Align(
                                  alignment: const Alignment(-0.2, 0.0),
                                  widthFactor: t,
                                  child: Padding(
                                    padding: Directionality.of(context) ==
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
                                          _selectedColor.withOpacity(0.0),
                                          _selectedColor,
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

/// A tab to display in a [SalomonBottomBar]
class SalomonBottomBarItem {
  /// An icon to display.
  final Widget icon;

  /// An icon to display when this tab bar is active.
  final Widget? activeIcon;

  /// Text to display, ie `Home`
  final Widget title;

  /// A primary color to use for this tab.
  final Color? selectedColor;

  /// The color to display when this tab is not selected.
  final Color? unselectedColor;

  /// The gradient to use when selected
  final Gradient? selectedGradient;

  SalomonBottomBarItem({
    required this.icon,
    required this.title,
    this.selectedColor,
    this.unselectedColor,
    this.activeIcon,
    this.selectedGradient,
  });
}
