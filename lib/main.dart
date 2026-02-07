import 'package:flutter/material.dart';
import 'package:getx_app/app/app.dart';
import 'package:getx_app/app/services/dependencies.dart';

void main() {
  Dependencies.dependencies(); // Set up dependencies before running the app
  runApp(const GetXApp());
}

