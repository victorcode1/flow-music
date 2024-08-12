// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

HeaderBuilder headerImage() {
  return (context, constraints, _) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: FlutterLogo(),
    );
  };
}

HeaderBuilder headerIcon(IconData icon) {
  return (context, constraints, shrinkOffset) {
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 40),
      child: Icon(
        icon,
        color: Colors.blue,
        size: constraints.maxWidth / 4 * (1 - shrinkOffset),
      ),
    );
  };
}

SideBuilder sideImage() {
  return (context, constraints) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(constraints.maxWidth / 4),
        child: const FlutterLogo(),
      ),
    );
  };
}

SideBuilder sideIcon(IconData icon) {
  return (context, constraints) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Icon(
        icon,
        color: Colors.blue,
        size: constraints.maxWidth / 3,
      ),
    );
  };
}
