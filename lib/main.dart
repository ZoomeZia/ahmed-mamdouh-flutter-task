import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tasks/otex_app.dart';

void main() {
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      path: 'assets/translations',
      startLocale: const Locale('ar', 'EG'),
      child: const OtexApp(),
    ),
  );
}
