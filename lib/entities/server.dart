// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Packages
import 'package:samp_query/samp_query.dart';

/// An object that represents an individual information of a Server.
///
/// Each instance of [ServerInfo] holds data about a specific server, including its hostname, address, gamemode,
/// and player count.
class ServerInfo {
  /// Hostname of the server.
  final String hostname;

  /// Address of the server [ip:port].
  final String address;

  /// Gamemode of the server.
  final String gamemode;

  /// Current amount of players online on the server.
  final int players;

  /// Maximum amount of players that can join the server.
  final int maxPlayers;

  ServerInfo(
    this.hostname,
    this.address,
    this.gamemode,
    this.players,
    this.maxPlayers,
  );

  factory ServerInfo.fromInfo(Info info) {
    return ServerInfo(
      info.hostname,
      info.address,
      info.gamemode,
      info.players,
      info.maxPlayers,
    );
  }
}
