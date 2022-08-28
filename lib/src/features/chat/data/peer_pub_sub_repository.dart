import 'package:flutter_inappwebview/flutter_inappwebview.dart';

/// Publish and subscribe to peers on IPFS pubsub.
class PeerPubSubRepository {
  late HeadlessInAppWebView _headlessWebView;

  /// Listens to the peer Id on IPFS pubsub for data.
  Stream<String> listenToPeerId() {
    throw UnimplementedError();
  }

  /// Broadcasts data to IPFS pubsub using the peer Id.
  Stream<String> broadcastOnPeerId() {
    throw UnimplementedError();
  }
}
