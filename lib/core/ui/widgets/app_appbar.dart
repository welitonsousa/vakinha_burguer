import 'package:dart_week/core/constants/app_images.dart';
import 'package:flutter/material.dart';

class AppAppbar extends AppBar {
  AppAppbar({
    Key? key,
    double elevation = 2,
  }) : super(
          key: key,
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: elevation,
          title: Image.asset(
            AppImages.logo,
            height: 40,
          ),
          iconTheme: const IconThemeData(color: Colors.black),
        );
}
