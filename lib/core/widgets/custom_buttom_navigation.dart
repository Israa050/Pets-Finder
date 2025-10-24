import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pets_finder_app/core/helpers/extensions.dart';
import 'package:pets_finder_app/core/routing/routes.dart';
import 'package:pets_finder_app/core/themes/colors/app_colors.dart';
import 'package:pets_finder_app/core/themes/styles/styles.dart';
import 'package:pets_finder_app/features/home/presentation/screens/favorite_screen.dart';
import 'package:pets_finder_app/features/home/presentation/screens/home_screen.dart';

class CustomButtomNavigation extends StatefulWidget {

  CustomButtomNavigation({super.key});

  @override
  State<CustomButtomNavigation> createState() => _CustomButtomNavigationState();
}

class _CustomButtomNavigationState extends State<CustomButtomNavigation> {
  int selectedIndex = 0;

  // Keep screens alive
  final List<Widget> _screens = [
    HomeScreen(),
    FavoriteScreen(),
  
  ];

  // Navigation items data
  final List<_NavItem> _navItems = [
    _NavItem(iconPath: 'assets/svgs/home.svg'),
    _NavItem(iconPath: 'assets/svgs/heart.svg'),
    _NavItem(iconPath: 'assets/svgs/messages.svg'),
    _NavItem(iconPath: 'assets/svgs/profile-circle.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedIndex==0? 'Find Your Forever Pet': 'Your Favorite Pets',
          style: TextStyles.font24BlackBold,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: SvgPicture.asset('assets/svgs/notification.svg'),
          ),
        ],
      ),
      body: _screens[selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x0D000000), // #0000000D
              blurRadius: 4,
              spreadRadius: 0,
              offset: Offset(0, -4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 23),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(_navItems.length, (index) {
              final item = _navItems[index];
              final isSelected = selectedIndex == index;

              return GestureDetector(
                key: Key('bottom_nav_$index'), // <- Add this
                onTap: () => setState(() => selectedIndex = index),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      item.iconPath,
                      color: isSelected ? AppColors.primaryGreen : Colors.grey,
                    ),
                    
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}

// Simple helper class to hold nav item data
class _NavItem {
  final String iconPath;

  _NavItem({required this.iconPath});
}
