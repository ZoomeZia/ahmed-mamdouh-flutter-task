import 'package:flutter/material.dart';
import 'package:flutter_tasks/feature/filter/ui/filter_screen.dart';
import 'package:flutter_tasks/feature/packages/ui/packages_screen.dart';

class AppRouter {
  AppRouter._();

  static goToPackagesScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PackagesScreen()),
    );
  }

  static goToFilterScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FilterScreen()),
    );
  }
}
