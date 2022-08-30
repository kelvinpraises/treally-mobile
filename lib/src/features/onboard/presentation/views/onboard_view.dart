import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../controllers/onboard_controller.dart';
import '../widgets/onboard_nav.dart';

class OnboardView extends HookConsumerWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardData = ref.watch(onboardControllerProvider);
    final pageController = usePageController(initialPage: 0);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black45,
              child: SafeArea(
                child: onboardData.when(
                  data: (data) {
                    if (pageController.hasClients) {
                      pageController.jumpToPage(data.index);
                    }

                    final images = data.appFeatures.map((e) {
                      return Center(
                        child: Text(e.imageAsset),
                      );
                    }).toList();

                    return PageView(
                      controller: pageController,
                      children: images,
                    );
                  },
                  error: (e, s) {
                    return const Center(
                      child: Text('Uh oh. Something went wrong!'),
                    );
                  },
                  loading: () {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                ),
              ),
            ),
          ),
          const OnboardNav(),
        ],
      ),
    );
  }
}
