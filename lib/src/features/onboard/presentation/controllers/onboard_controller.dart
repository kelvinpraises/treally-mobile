import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/app_features_model.dart';
import '../../domain/onboard_model.dart';

class OnboardControllerNotifier
    extends StateNotifier<AsyncValue<OnboardModel>> {
  OnboardControllerNotifier({
    this.appFeatures = const [
      AppFeatures(
        title: 'Wallet',
        detail: 'Create your wallet manage vaults',
        imageAsset: '1',
      ),
      AppFeatures(
        title: 'Chat',
        detail: 'Send decentralized encrypted messages to contacts using IPFS',
        imageAsset: '2',
      ),
      AppFeatures(
        title: 'Account Recovery',
        detail: 'Create recovery contracts for your Universal Profile.',
        imageAsset: '3',
      ),
    ],
  }) : super(const AsyncLoading()) {
    final OnboardModel onboardModel = OnboardModel(
      index: 0,
      appFeatures: appFeatures,
      resetFeatures: false,
    );

    state = AsyncValue.data(onboardModel);
  }

  final List<AppFeatures> appFeatures;

  void nextPage() {
    state = AsyncValue.data(() {
      int index;
      bool resetFeatures;

      final currentIndex = state.asData!.value.index;
      final features = state.asData!.value.appFeatures;

      if (currentIndex == features.length - 2) {
        index = currentIndex + 1;
        resetFeatures = true;
      } else if (currentIndex < features.length - 1) {
        index = currentIndex + 1;
        resetFeatures = false;
      } else if (currentIndex == features.length - 1) {
        index = 0;
        resetFeatures = false;
      } else {
        index = currentIndex;
        resetFeatures = false;
      }

      final OnboardModel onboardModel = OnboardModel(
        index: index,
        appFeatures: appFeatures,
        resetFeatures: resetFeatures,
      );

      return onboardModel;
    }());
  }
}

final onboardControllerProvider =
    StateNotifierProvider<OnboardControllerNotifier, AsyncValue<OnboardModel>>(
        (ref) {
  return OnboardControllerNotifier();
});
