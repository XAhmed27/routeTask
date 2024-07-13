import 'package:flutter/material.dart';
import 'package:routetask/config/di/di.dart';
import 'package:routetask/e_commerce.dart';

void main() {
  configureDependencies();
  runApp(const ECommerce());
}


