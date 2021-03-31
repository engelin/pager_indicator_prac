import 'package:flutter/material.dart';

class CustomTabBarModel {
  final String title;

  CustomTabBarModel.fromMap(Map data)
      : title = data['title'];
}
