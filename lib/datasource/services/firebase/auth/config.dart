// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// ignore_for_file: do_not_use_environment, constant_identifier_names, non_constant_identifier_names

import 'package:flutter/foundation.dart';

String get GOOGLE_CLIENT_ID {
  if (defaultTargetPlatform == TargetPlatform.macOS) {
    return '387031162675-i5bjfnrnig2vpdr1cc3r85qq7fknpog3.apps.googleusercontent.com';
  } else if (defaultTargetPlatform == TargetPlatform.iOS) {
    return '387031162675-i5bjfnrnig2vpdr1cc3r85qq7fknpog3.apps.googleusercontent.com';
  } else if (defaultTargetPlatform == TargetPlatform.windows) {
    return '387031162675-i5bjfnrnig2vpdr1cc3r85qq7fknpog3.apps.googleusercontent.com';
  } else {
    return '387031162675-i5bjfnrnig2vpdr1cc3r85qq7fknpog3.apps.googleusercontent.com';
  }
}

const GOOGLE_REDIRECT_URI =
    'https://react-native-firebase-testing.firebaseapp.com/__/auth/handler';

const TWITTER_API_KEY = String.fromEnvironment('TWITTER_API_KEY');
const TWITTER_API_SECRET_KEY = String.fromEnvironment('TWITTER_API_SECRET_KEY');
const TWITTER_REDIRECT_URI = 'ffire://';

const FACEBOOK_CLIENT_ID = '128693022464535';