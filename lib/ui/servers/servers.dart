// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter
import 'package:flutter/material.dart';

// Internal
import 'package:artplay_launcher/bloc/server/server_bloc.dart';
import 'package:artplay_launcher/state/server_state_event.dart';
import 'package:artplay_launcher/ui/colors.dart';
import 'package:artplay_launcher/ui/widgets/server_tile.dart';

// Packages
import 'package:logging/logging.dart';
import 'package:provider/provider.dart';

class Servers extends StatefulWidget {
  const Servers({super.key});

  @override
  State<Servers> createState() => _ServersState();
}

class _ServersState extends State<Servers> {
  final log = Logger('Servers');
  late ServerBloc _serverBloc;

  @override
  void initState() {
    super.initState();

    log.fine('initState() - fetch servers');

    _serverBloc = Provider.of<ServerBloc>(context, listen: false);
    _serverBloc.loadServers(LoadServersEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _handleRefresh() {
    log.fine('_handleRefresh');

    _serverBloc.loadServers(RefreshServersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: RefreshIndicator(
                color: AppColors.primary,
                backgroundColor: AppColors.background,
                onRefresh: () async {
                  /// Trigger the refresh action (e.g, fetch server info again)
                  _handleRefresh();
                },
                child: StreamBuilder<ServerState>(
                  initialData: ServerInitial(),
                  stream: _serverBloc.stateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;

                    if (state is ServerInitial) {
                      /// TODO:
                    } else if (state is ServerLoadInProgress) {
                      return const Center(
                        child:
                            CircularProgressIndicator(color: AppColors.primary),
                      );
                    } else if (state is ServerLoadFailure) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                /// Retry fetching server info
                                _handleRefresh();
                              },
                              child: const Text('Tentar novamente'),
                            ),
                          ],
                        ),
                      );
                    } else if (state is ServerLoadSuccess) {
                      final data = state;

                      return ListView.builder(
                        itemCount: data.serverInfos!.length,
                        itemBuilder: (context, index) {
                          final server = data.serverInfos![index];

                          return ServerTile(
                            hostname: server.hostname,
                            address: server.address,
                            gamemode: server.gamemode,
                            players: '${server.players}/${server.maxPlayers}',
                            onTap: () {},
                          );
                        },
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            )
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      extendBody: true,
    );
  }
}
