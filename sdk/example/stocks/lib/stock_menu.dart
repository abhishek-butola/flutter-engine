// Copyright 2015 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:sky' as sky;

import 'package:sky/widgets/checkbox.dart';
import 'package:sky/widgets/popup_menu.dart';
import 'package:sky/widgets/basic.dart';

export 'package:sky/widgets/popup_menu.dart' show PopupMenuStatus;

class StockMenu extends Component {
  StockMenu({
    String key,
    this.showing,
    this.onStatusChanged,
    this.autorefresh: false,
    this.onAutorefreshChanged
  }) : super(key: key);

  bool showing;
  PopupMenuStatusChangedCallback onStatusChanged;
  final bool autorefresh;
  final ValueChanged onAutorefreshChanged;

  Widget build() {
    var checkbox = new Checkbox(
      value: this.autorefresh,
      onChanged: this.onAutorefreshChanged
    );

    return new Positioned(
      child: new PopupMenu(
        items: [
          new Text('Add stock'),
          new Text('Remove stock'),
          new Flex([new Flexible(child: new Text('Autorefresh')), checkbox]),
        ],
        level: 4,
        showing: showing,
        onStatusChanged: onStatusChanged
      ),
      right: sky.view.paddingRight,
      top: sky.view.paddingTop
    );
  }
}
