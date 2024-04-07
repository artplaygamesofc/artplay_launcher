// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Packages
import 'package:samp_query/samp_query.dart';

/// A [ServerRepository] for handling fetches server data.
class ServerRepository {
  /// Fetches a list of servers.
  /// Each server is represented by its IP address and port number.
  /// Returns a list of [Server] objects.
  ///
  /// TODO: Implement functionality to load servers from a remote source.
  List<Server> fetchServers() {
    final servers = [
      Server('ip.artplaysamp.com', 7777),
      Server('ip.artplaysamp.com', 7778),
      Server('ip.artplaysamp.com', 7788),
      Server('ip.artplaysamp.com', 7789),
    ];

    return servers;
  }
}
