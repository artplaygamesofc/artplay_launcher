// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter
import 'package:flutter/material.dart';

// Internal
import 'package:artplay_launcher/ui/colors.dart';

abstract class CustomTheme {
  static ThemeData createTheme = ThemeData(
    fontFamily: 'Rubik',
    primaryColor: AppColors.mWhite,
    brightness: Brightness.dark,
    hintColor: AppColors.mWhite,
    shadowColor: Colors.black.withOpacity(0.4),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w300,
        height: 1.5,
      ),
      displayMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w700,
        height: 1.35,
      ),
      displaySmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        height: 1.35,
      ),
      headlineMedium: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        height: 1.35,
      ),
      headlineSmall: TextStyle(
        fontSize: 20.0,
        height: 1.35,
      ),
      titleLarge: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        height: 1.35,
      ),
      titleMedium: TextStyle(
        fontSize: 15.0,
        fontWeight: FontWeight.w500,
        height: 1.35,
      ),
      bodyLarge: TextStyle(
        fontSize: 14.0,
        height: 1.35,
      ),
      bodyMedium: TextStyle(
        fontSize: 12.0,
        height: 1.35,
      ),
      bodySmall: TextStyle(
        fontSize: 12.0,
        height: 1.35,
      ),
    ),
  );
}
