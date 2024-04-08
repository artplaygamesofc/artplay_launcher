// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter
import 'package:artplay_launcher/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Internal
import 'package:artplay_launcher/bloc/ui/pager_bloc.dart';
import 'package:artplay_launcher/bloc/download/download_bloc.dart';
import 'package:artplay_launcher/bloc/server/server_bloc.dart';
import 'package:artplay_launcher/repository/server_repository.dart';
import 'package:artplay_launcher/services/server_service.dart';
import 'package:artplay_launcher/ui/root/root.dart';

// Packages
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

// Performs all the necessary actions to bootstrap
// the application.
Future<Widget> initializeApp() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  Logger.root.level = Level.FINE;

  Logger.root.onRecord.listen((record) {
    print(
        '${record.level.name}: - ${record.time}: ${record.loggerName}: ${record.message}');
  });

  return ArtplayLauncherApp();
}

/// Artplay is a launcher for SA-MP.
// ignore: must_be_immutable
class ArtplayLauncherApp extends StatefulWidget {
  late ServerRepository serverRepository;
  late ServerService serverService;

  ArtplayLauncherApp({Key? key}) : super(key: key) {
    serverRepository = ServerRepository();

    serverService = ServerService(
      serverRepository,
    );
  }

  @override
  ArtplayLauncherAppState createState() => ArtplayLauncherAppState();
}

class ArtplayLauncherAppState extends State<ArtplayLauncherApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<PagerBloc>(
          create: (_) => PagerBloc(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<DownloadBloc>(
          create: (_) => DownloadBloc(),
          dispose: (_, value) => value.dispose(),
        ),
        Provider<ServerBloc>(
          create: (_) => ServerBloc(
            widget.serverService,
          ),
          dispose: (_, value) => value.dispose(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Artplay: launcher',
        home: const Root(title: 'Artplay: launcher'),
        theme: CustomTheme.createTheme,
      ),
    );
  }
}
