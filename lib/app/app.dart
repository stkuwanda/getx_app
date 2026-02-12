import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import 'package:getx_app/app/services/theme_service.dart';
import 'package:getx_app/app/services/translations.dart';

class GetXApp extends StatelessWidget {
   GetXApp({super.key});

  final ThemeService _themeService = Get.find<ThemeService>();

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GetX App',
    translations: AppTranslations(),
    locale: Locale('en', 'US'),
    fallbackLocale: Locale('en', 'US'),
    theme: ThemeData.light(), // Define the light theme for the application
    darkTheme: ThemeData.dark(), // Define the dark theme for the application
    themeMode: _themeService.theme, // Set the theme mode based on the user's preference
    initialRoute: AppPages.initial, // Set the initial route of the application
    getPages: AppPages.routes, // Define the routes for the application
  );
}