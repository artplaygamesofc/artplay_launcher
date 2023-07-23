// Copyright 2022-2023 Marlon "Eiss" Lorram. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:rxdart/rxdart.dart';

// This BLoC manages the logic related to page navigation.
class PagerBloc {
  final BehaviorSubject<int> _currentPage = BehaviorSubject<int>.seeded(0);

  Stream<int> get currentPageStream => _currentPage.stream;

  /// Method to change the current page.
  void changePage(int page) {
    _currentPage.add(page);
  }

  void dispose() {
    _currentPage.close();
  }
}
