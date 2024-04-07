// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Internal
import 'package:artplay_launcher/entities/server.dart';
import 'package:artplay_launcher/repository/server_repository.dart';

// Packages
import 'package:logging/logging.dart';
import 'package:samp_query/samp_query.dart';

/// A [ServerService] for handling fetches server information.
class ServerService {
  final log = Logger('ServerService');
  final ServerRepository _serverRepository;
  final SAMPQuery _sampQuery;

  ServerService(this._serverRepository) : _sampQuery = SAMPQuery();

  /// Fetches information for a specific server.
  /// Returns a `Future` that completes with a [ServerInfo] if the server information was fetched successfully.
  /// Returns `null` if there was an error fetching the server information.
  Future<ServerInfo?> _fetchServerInfo(Server server) async {
    try {
      final info = await _sampQuery.send(server);
      return ServerInfo.fromInfo(info!);
    } catch (e) {
      log.severe('Failed to fetch server info', e);
      return null;
    }
  }

  /// Fetches information for all servers.
  /// Returns a `Future` that completes with a list of [ServerInfo].
  Future<List<ServerInfo>> fetchServersInfo() async {
    var serverInfoFetches = _serverRepository
        .fetchServers()
        .map((server) => _fetchServerInfo(server))
        .toList();

    var results = await Future.wait(serverInfoFetches);
    var serverInfos = results.whereType<ServerInfo>().toList();

    return serverInfos;
  }
}
