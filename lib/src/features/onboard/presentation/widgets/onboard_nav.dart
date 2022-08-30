import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/wedge_button.dart';
import '../../../../constants/colors.dart';
import '../controllers/onboard_controller.dart';
import '../views/create_profile_view.dart';
import '../views/import_profile_view.dart';

class OnboardNav extends HookConsumerWidget {
  const OnboardNav({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onboardNotifier = ref.read(onboardControllerProvider.notifier);
    final onboardData = ref.watch(onboardControllerProvider);

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          color: kLightOrange,
          height: 320.0,
          child: Column(
            children: [
              const SizedBox(height: 70.0),
              Center(
                child: Text(
                  onboardData.maybeWhen(
                    data: (d) => d.appFeatures[d.index].title,
                    orElse: () {
                      return 'Wallets';
                    },
                  ),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: kBlack2,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              SizedBox(
                height: 100,
                child: Center(
                  child: Text(
                    onboardData.maybeWhen(
                      data: (d) => d.appFeatures[d.index].detail,
                      orElse: () {
                        return 'Wallets';
                      },
                    ),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    WedgeButton(
                      width: 170.0,
                      label: 'Import',
                      callback: () {
                        Navigator.restorablePushNamed(context, ImportProfileView.routeName);
                      },
                      color: kGreen,
                      fillColor: kWhite,
                    ),
                    WedgeButton(
                      width: 170.0,
                      label: 'Create',
                      callback: () {
                        Navigator.restorablePushNamed(context, CreateProfileView.routeName);
                      },
                      color: kGreen2,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -35.0,
          left: 0,
          right: 0,
          child: Container(
            height: 100.0,
            width: 100.0,
            decoration: const BoxDecoration(
              color: kLightOrange,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  try {
                    onboardNotifier.nextPage();
                  } catch (e) {
                    print(e);
                  }
                },
                child: AnimatedContainer(
                  decoration: const BoxDecoration(
                    color: kGreen,
                    shape: BoxShape.circle,
                  ),
                  height: 70.0,
                  width: 70.0,
                  duration: const Duration(milliseconds: 2500),
                  child: Center(
                    child: Icon(
                      onboardData.maybeWhen(
                        data: (d) => d.resetFeatures
                            ? Icons.refresh
                            : Icons.navigate_next,
                        orElse: () {
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
