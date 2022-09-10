// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Internal
import 'package:launcher/bloc/bloc.dart';

// Packages
import 'package:logging/logging.dart';

/// The BLoC provides files downloads.
class DownloadBloc extends Bloc {
  final log = Logger('DownloadBloc');

  DownloadBloc() {
    _init();
  }

  void _init() {}

  @override
  void dispose() {}
}
