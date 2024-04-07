// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Internal
import 'package:artplay_launcher/entities/server.dart';

/// Events
abstract class ServerEvent {}

class LoadServersEvent extends ServerEvent {}

class RefreshServersEvent extends ServerEvent {}

/// State
abstract class ServerState {
  final List<ServerInfo>? serverInfos;

  ServerState({this.serverInfos});
}

class ServerInitial extends ServerState {}

class ServerLoadInProgress extends ServerState {}

class ServerLoadSuccess extends ServerState {
  ServerLoadSuccess({required List<ServerInfo> serverInfos})
      : super(serverInfos: serverInfos);
}

class ServerLoadFailure extends ServerState {}
