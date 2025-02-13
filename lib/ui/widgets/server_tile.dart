// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Flutter
import 'package:flutter/material.dart';

// Internal
import 'package:artplay_launcher/ui/icons.dart';
import 'package:artplay_launcher/ui/colors.dart';

/// A widget that displays information about a game server in a list tile format.
///
/// It showcases the server's hostname, address, gamemode, and current player count,
/// alongside corresponding icons for visual enhancement. Tapping on the tile triggers
/// an action defined by the [onTap] callback.
class ServerTile extends StatelessWidget {
  /// Hostname of the server.
  final String hostname;

  /// Address of the server [ip:port].
  final String address;

  /// Gamemode of the server.
  final String gamemode;

  /// Current amount of players online on the server [players/maxPlayers].
  final String players;

  /// Callback function to be executed when the tile is tapped. This allows for custom
  /// action, such as navigation to a server detail page or displaying additional information...
  final VoidCallback onTap;

  /// Create a [ServerTile] widget.
  ///
  /// All parameters are required and must be provided when creating an
  /// instance of [ServerTile].
  const ServerTile({
    super.key,
    required this.hostname,
    required this.address,
    required this.gamemode,
    required this.players,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
          color: Colors.black.withAlpha(0x21),
        ),
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hostname,
                    style: Theme.of(context).textTheme.titleLarge?.apply(
                          color: AppColors.primary,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(
                        CustomIcons.dns,
                        color: AppColors.primary,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          address,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        CustomIcons.gamepad,
                        color: AppColors.primary,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          gamemode,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(
                        CustomIcons.person,
                        color: AppColors.primary,
                        size: 15,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          players,
                          style: Theme.of(context).textTheme.bodyLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
