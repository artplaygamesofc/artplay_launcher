// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Internal
import 'package:artplay_launcher/bloc/ui/pager_bloc.dart';
import 'package:artplay_launcher/ui/colors.dart';
import 'package:artplay_launcher/ui/icons.dart';
import 'package:artplay_launcher/ui/servers/servers.dart';

// Flutter
import 'package:flutter/material.dart';

// Packages
import 'package:provider/provider.dart';
import 'package:bottom_nav_bar/bottom_nav_bar.dart';

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
    final pager = Provider.of<PagerBloc>(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ic_launcher_background.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          StreamBuilder<int>(
            stream: pager.currentPageStream,
            builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
              final currentPage = snapshot.data;

              switch (currentPage) {
                case 0:
                  return const Text("Launcher");
                case 1:
                  return const Servers();
                case 3:
                  return const Text("Definições");
                default:
                  return Container();
              }
            },
          ),
        ],
      ),
      bottomNavigationBar: StreamBuilder<int>(
        stream: pager.currentPageStream,
        initialData: 0,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          final index = snapshot.data ?? 0;

          return BottomNavBar(
            backgroundColor: AppColors.background,
            selectedColor: AppColors.primary,
            selectedIndex: index,
            onTap: pager.changePage,
            items: <BottomNavBarItem>[
              BottomNavBarItem(
                icon: CustomIcons.gamepad,
                label: 'Launcher',
              ),
              BottomNavBarItem(
                icon: CustomIcons.dns,
                label: 'Servidores',
              ),
              BottomNavBarItem(
                icon: CustomIcons.settings,
                label: 'Definições',
              ),
            ],
          );
        },
      ),
      extendBody: true,
      backgroundColor: Colors.transparent,
    );
  }
}
