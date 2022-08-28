import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/button.dart';

class InitialView extends HookConsumerWidget {
  const InitialView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageController = usePageController(initialPage: 0);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.black45,
              child: PageView(
                controller: pageController,
                children: [
                  Center(
                    child: Container(
                      color: Colors.green,
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.pink,
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                  Center(
                    child: Container(
                      color: Colors.lime,
                      height: 200.0,
                      width: 200.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                color: Colors.white,
                height: 300.0,
                child: Column(children: [
                  const SizedBox(height: 70.0),
                  const Center(
                    child: Text(
                      'Wallet',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Button(
                        label: 'Import',
                        callback: () {
                          print('import');
                        },
                      ),
                      Button(
                        label: 'Create',
                        callback: () {
                          print('create');
                        },
                      )
                    ],
                  )
                ]),
              ),
              Positioned(
                top: -35.0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.orange,
                        shape: BoxShape.circle,
                      ),
                      height: 70.0,
                      width: 70.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
