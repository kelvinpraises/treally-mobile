import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common_widgets/app_bar.dart';
import '../../../../common_widgets/input.dart';
import '../../../../common_widgets/wedge_button.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/space.dart';
import '../controllers/import_profile_controller.dart';
import '../widgets/header.dart';

class ImportProfileView extends HookConsumerWidget {
  const ImportProfileView({Key? key}) : super(key: key);

  static const routeName = '/import-profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final importProfileControllerNotifier = ref.watch(
      importProfileControllerProvider.notifier,
    );
    final importProfileController = ref.watch(importProfileControllerProvider);

    final privateKeyTextEditController = useTextEditingController();
    final universalProfileTextEditController = useTextEditingController();

    return Scaffold(
      backgroundColor: kLightOrange,
      appBar: const CustomAppBar(
        title: 'Import Profile',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Import Profile',
              subTitle: 'Import an existing universal Profile.',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    onChanged: () async {
                      final universalProfile =
                          universalProfileTextEditController.text.trim();
                      await importProfileControllerNotifier
                          .updateUniversalProfile(universalProfile);

                      final privateKey =
                          privateKeyTextEditController.text.trim();
                      await importProfileControllerNotifier
                          .updatePrivateKey(privateKey);
                    },
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Universal Profile',
                          textEditController:
                              universalProfileTextEditController,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(height: kSpaceM),
                        CustomTextField(
                          hintText: 'Private Key',
                          textEditController: privateKeyTextEditController,
                          textInputAction: TextInputAction.done,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: WedgeButton(
                loading: importProfileController.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                label: 'Import',
                callback: () {
                  importProfileControllerNotifier.importProfile();
                },
                width: double.infinity,
              ),
            )
          ],
        ),
      ),
    );
  }
}
