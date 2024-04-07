// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Internal
import 'package:artplay_launcher/bloc/bloc.dart';
import 'package:artplay_launcher/services/server_service.dart';
import 'package:artplay_launcher/state/server_state_event.dart';

// Packages
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

/// This Bloc provides server information.
///
/// It listens for server load events and updates the server state accordingly.
class ServerBloc extends Bloc {
  final log = Logger('ServerBloc');
  final ServerService _serverService;

  /// Subject to manage the state of the server.
  final _serverState = BehaviorSubject<ServerState>(sync: true);

  /// Subject to manage server load events.
  final _serverEvent = PublishSubject<ServerEvent>();

  ServerBloc(
    this._serverService,
  ) {
    _init();
  }

  void _init() {
    /// Listen to servers load events
    _handleServersEvents();
  }

  /// Handles server load events.
  /// Depending on the event type, it either fetches server info
  /// or refreshes the servers.
  void _handleServersEvents() {
    _serverEvent.listen((ServerEvent event) {
      if (event is LoadServersEvent) {
        _fetchServersInfo();
      } else if (event is RefreshServersEvent) {
        _refreshServers();
      }
    });
  }

  /// Refreshes the servers by re-fetching the server info.
  void _refreshServers() {
    _fetchServersInfo();
  }

  /// Fetches server info.
  /// Updates the server state based on the fetched info.
  void _fetchServersInfo() async {
    _serverState.add(ServerLoadInProgress());

    try {
      var serverInfos = await _serverService.fetchServersInfo();
      if (serverInfos.isEmpty) {
        _serverState.add(ServerInitial());
      } else {
        _serverState.add(ServerLoadSuccess(serverInfos: serverInfos));
      }
    } catch (_) {
      _serverState.add(ServerLoadFailure());
    }
  }

  @override
  void dispose() {
    _serverState.close();

    super.dispose();
  }

  /// Stream containing the current state of the server load.
  Stream<ServerState> get stateStream => _serverState.stream;

  /// Function to load servers. Adds a server state to the state subject.
  void Function(ServerEvent) get loadServers => _serverEvent.sink.add;
}
