import 'package:flutter/material.dart';
import 'package:hashed_system_assignment/core/app_colors.dart';
import 'package:hashed_system_assignment/screens/bottom_bar/components/bottom_bar_active_iocn.dart';
import 'package:hashed_system_assignment/screens/bottom_bar/components/bottom_bar_label_text.dart';
import 'package:hashed_system_assignment/screens/home/home_screen.dart';
import 'package:hashed_system_assignment/widgets/bottom_bar.dart';
import 'package:icons_plus/icons_plus.dart';

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _MainScreenState();
}

class _MainScreenState extends State<AppBottomBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
    const HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],

      bottomNavigationBar: Container(
        width: double.infinity,
        height: 80,
        decoration: BoxDecoration(color: Colors.red),
        child: SalomonBottomBar(
          onTap: (index) => setState(() => _currentIndex = index),
          selectedItemColor: AppColors.textFieldBorderColor,
          unselectedItemColor: Color(0xffBFC0C5),
          backgroundColor: Colors.white,
          itemShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          currentIndex: _currentIndex,
          items: [
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              activeIcon: BottomBarActiveIconWidget(icon: Icons.home),
              title: BottomBarLabelTextWidget(label: 'Home'),
              selectedGradient: const LinearGradient(
                colors: [Color(0xFF5ACD84), Color(0xFF56AEFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),

            SalomonBottomBarItem(
              icon: Icon(Clarity.grid_view_solid),
              activeIcon: BottomBarActiveIconWidget(
                icon: Clarity.grid_view_solid,
              ),
              title: BottomBarLabelTextWidget(label: 'Categories'),
              selectedGradient: const LinearGradient(
                colors: [Color(0xFF5ACD84), Color(0xFF56AEFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.location_bold),

              activeIcon: BottomBarActiveIconWidget(
                icon: Iconsax.location_bold,
              ),
              title: BottomBarLabelTextWidget(label: 'Locations'),
              selectedGradient: const LinearGradient(
                colors: [Color(0xFF5ACD84), Color(0xFF56AEFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            SalomonBottomBarItem(
              icon: const Icon(Iconsax.user_bold),
              selectedColor: const Color(0xFF00A676),
              activeIcon: BottomBarActiveIconWidget(icon: Iconsax.user_bold),
              title: BottomBarLabelTextWidget(label: 'Profile'),
              selectedGradient: const LinearGradient(
                colors: [Color(0xFF5ACD84), Color(0xFF56AEFF)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
