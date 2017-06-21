// Copyright (c) 2017, julip. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'view.dart';
import 'controller.dart';
import 'spielModel.dart';

void main() {
  SpielModel _model = new SpielModel();
  View _view = new View(_model);
  Controller controller = new Controller(_view);
  _view.updateView("");
  controller.start();
}
