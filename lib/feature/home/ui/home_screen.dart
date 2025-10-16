import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/helpers/assets.dart';
import 'package:flutter_tasks/core/routing/app_route.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/feature/products/ui/product_screen.dart';
import 'package:flutter_tasks/feature/home/ui/widgets/nav_item.dart';
import 'package:flutter_tasks/feature/tests/add_ad_screen.dart';
import 'package:flutter_tasks/feature/tests/chat_screen.dart';
import 'package:flutter_tasks/feature/tests/my_ad_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  List<Widget> get _screens => [
    const ProductScreen(), // Home
    const ChatScreen(), // Chat
    const AddAdScreen(), // Add Ad
    const MyAdScreen(), // My Ads
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.whiteColor,

      body: _screens[_currentIndex],
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavItem(
                index: 0,
                iconPath: Assets.homeIcon,
                label: 'الرئيسية',
                isActive: _currentIndex == 0,
                onTap: () {
                  _currentIndex = 0;
                  setState(() {});
                },
              ),
              NavItem(
                index: 1,
                iconPath: Assets.chatIcon,
                label: 'محادثة',
                isActive: _currentIndex == 1,
                onTap: () {
                  _currentIndex = 1;
                  setState(() {});
                },
              ),
              NavItem(
                index: 2,
                iconPath: Assets.addAdIcon,
                label: 'أضف إعلان',
                isActive: false,
                isSpecial: true,
                onTap: () {
                  _currentIndex = 2;
                  setState(() {});
                },
              ),
              NavItem(
                index: 3,
                iconPath: Assets.myAdsIcon,
                label: 'إعلاناتي',
                isActive: _currentIndex == 3,
                onTap: () {
                  _currentIndex = 3;
                  setState(() {});
                },
              ),
              NavItem(
                index: 4,
                iconPath: Assets.accountIcon,
                label: 'حسابي',
                isActive: false,
                onTap: () {
                  AppRouter.goToPackagesScreen(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
