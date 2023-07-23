// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// Internal
import 'package:flutter/widgets.dart';

/// [CustomIcons] class represents a set of custom icons.
///
/// The class contains a set of custom icons used in the application.
///
/// The icon constants defined in this class are:
///
/// - `gamepad`: represents a videogame controller icon.
/// - `dns`: represents the DNS settings icon.
/// - `person`: represents a person profile icon.
/// - `settings`: represents the settings icon.
class CustomIcons {
  static const _kFontFam = 'ArtplayIcons';

  static const IconData gamepad = IconData(0xE5E8, fontFamily: _kFontFam);
  static const IconData dns = IconData(0xF6C1, fontFamily: _kFontFam);
  static const IconData person = IconData(0xE2EB, fontFamily: _kFontFam);
  static const IconData settings = IconData(0xE57F, fontFamily: _kFontFam);
}
