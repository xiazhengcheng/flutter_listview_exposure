import 'dart:async';

import 'package:flutter/services.dart';
import 'package:uni_links/uni_links.dart';

Future<void> schemeService() async {
  StreamSubscription _sub;

  // String? initialLink;
  // try {
  //   // App未打开的状态在这个地方捕获scheme
  //   initialLink = await getInitialLink();
  //   Toast.show("App未打开的状态在这个地方捕获scheme《$initialLink}》");
  //   if (initialLink != null) {
  //     StringUtils.schemePush(initialLink);
  //   }
  //   // App打开的状态监听scheme
  //   linkStream.listen((String? link) {
  //     // some code here
  //   }, onError: (err) {
  //     print(err);
  //     // Handle exception by warning the user their action did not succeed
  //   }, onDone: () {
  //     // some code here
  //   });
  // } on PlatformException {
  //   initialLink = 'Failed to get initial link.';
  // } on FormatException {
  //   initialLink = 'Failed to parse the initial link as Uri.';
  // }

  initUniLinks();
  initialUri();
  // Attach a listener to the stream
  _sub = linkStream.listen((String? link) {
    // Parse the link and warn the user, if it is not correct
    print('Parse the link and warn the user, if it is not correct----------$link');

  }, onError: (err) {
    print('Handle exception by warning the user their action did not succeed');
    // Handle exception by warning the user their action did not succeed
  });

  _sub = uriLinkStream.listen((Uri? uri) {
    // Use the uri and warn the user, if it is not correct
    print('Use the uri and warn the user, if it is not correct');

  }, onError: (err) {
    // Handle exception by warning the user their action did not succeed
    print('Handle exception by warning the user their action did not succeed');

  });
}

Future<void> initUniLinks() async {
  // Platform messages may fail, so we use a try/catch PlatformException.
  try {
    final initialLink = await getInitialLink();
    // Parse the link and warn the user, if it is not correct,
    // but keep in mind it could be `null`.
  } on PlatformException {
    // Handle exception by warning the user their action did not succeed
    // return?
  }
}

Future<void> initialUri() async {
  try {
    final initialUri = await getInitialUri();
    // Use the uri and warn the user, if it is not correct,
    // but keep in mind it could be `null`.
  } on FormatException {
    // Handle exception by warning the user their action did not succeed
    // return?
  }
}

