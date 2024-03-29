// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

/// Base class for all BLoCs to give each one a dispose method
/// which can then be hooked into the dispose() call from Provider.
abstract class Bloc {
  Bloc();

  void dispose() {}
}
