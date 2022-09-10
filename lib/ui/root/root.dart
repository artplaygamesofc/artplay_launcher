// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter
import 'package:flutter/material.dart';

class Root extends StatefulWidget {
  final String title;

  const Root({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/ic_launcher_background.png'),
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
