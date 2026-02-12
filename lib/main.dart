import 'package:flutter/material.dart';
import 'package:getx_app/app/app.dart';
import 'package:getx_app/app/services/dependencies.dart';

void main() async {
  await Dependencies.dependencies(); // Set up or initialize project dependencies before running the app
  runApp(GetXApp());
}
