import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';
import 'package:getx_app/app/services/translations.dart';

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GetX App',
    translations: AppTranslations(),
    locale: Locale('en', 'US'),
    fallbackLocale: Locale('en', 'US'),
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: AppPages.initial, // Set the initial route of the application
    getPages: AppPages.routes, // Define the routes for the application
  );
}