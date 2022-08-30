import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/create_profile_model.dart';

class RemoteProfileRepository {
  RemoteProfileRepository() {
    _headlessWebView = HeadlessInAppWebView(
      initialUrlRequest: URLRequest(
        // url: Uri.parse("https://github.com/flutter"),
        url: Uri.dataFromString(
          '<html><body>treally world</body></html>',
          mimeType: 'text/html',
          encoding: Encoding.getByName('utf-8'),
        ),
      ),
      onWebViewCreated: (controller) {},
      onLoadStart: (controller, url) {},
      onLoadStop: (controller, url) {},
      onLoadError: (controller, url, code, message) {},
    );
  }

  late HeadlessInAppWebView _headlessWebView;

  Future<String> _web3() async {
    return await rootBundle.loadString('assets/js/web3.js');
  }

  /// Creates an externally owned account.
  Future<String> _createEOA(String web3) async {
    String code = '''
            //js
            $web3        
            const Web3 = require("web3");
            const web3 = new Web3();

            const myEOA = web3.eth.accounts.create();
            return myEOA.privateKey;
        ''';

    final controller = _headlessWebView.webViewController;

    final result = await controller.callAsyncJavaScript(functionBody: code);

    if (result?.value != null) {
      return result?.value as String;
    } else {
      print(result!.error);
      throw ErrorDescription('Something went wrong');
    }
  }

  /// Creates a universal profile on Lukso's blockchain.
  Future<void> createUP(CreateProfileModel profileDetails) async {
    await _headlessWebView.run();

    final web3 = await _web3();

    final myEOA = await _createEOA(web3);

    print(myEOA);

    final code = '''
            //js
            $web3        
            const Web3 = require("web3");
            const web3 = new Web3();

            const myEOA = web3.eth.accounts.create();
            return myEOA.privateKey;
        ''';

    final controller = _headlessWebView.webViewController;

    final result = await controller.callAsyncJavaScript(functionBody: code);

    if (result?.value != null) {
      _headlessWebView.dispose();
      // return result?.value as String;
    } else {
      print(result!.error);
      _headlessWebView.dispose();
      throw ErrorDescription('Something went wrong');
    }
  }
}

final remoteProfileRepositoryProvider =
    Provider<RemoteProfileRepository>((ref) {
  return RemoteProfileRepository();
});
