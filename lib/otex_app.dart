import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasks/core/theming/colors_manager.dart';
import 'package:flutter_tasks/feature/home/ui/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class OtexApp extends StatelessWidget {
  const OtexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        scaffoldBackgroundColor: ColorsManager.whiteColor,
        textTheme: GoogleFonts.tajawalTextTheme(),
      ),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const HomeScreen(),
    );
  }
}
