import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_app/app/routes/app_pages.dart';

class GetXApp extends StatelessWidget {
  const GetXApp({super.key});

  @override
  Widget build(BuildContext context) => GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'GetX App',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    initialRoute: AppPages.initial, // Set the initial route of the application
    getPages: AppPages.routes, // Define the routes for the application
  );
}