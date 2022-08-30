import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:treally_mobile/src/common_widgets/wedge_button.dart';
import 'package:treally_mobile/src/constants/space.dart';

import '../../../../common_widgets/app_bar.dart';
import '../../../../common_widgets/input.dart';
import '../../../../constants/colors.dart';
import '../controllers/create_profile_controller.dart';
import '../widgets/header.dart';

class CreateProfileView extends HookConsumerWidget {
  const CreateProfileView({Key? key}) : super(key: key);

  static const routeName = '/create-profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createProfileControllerNotifier =
        ref.watch(createProfileControllerProvider.notifier);
    final createProfileController = ref.watch(createProfileControllerProvider);
    final nameTextEditController = useTextEditingController();
    final descriptionTextEditController = useTextEditingController();

    return Scaffold(
      backgroundColor: kLightOrange,
      appBar: const CustomAppBar(
        title: 'Create Profile',
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Header(
              title: 'Create Profile',
              subTitle: 'Creating a new Universal Profile.',
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Form(
                    onChanged: () async {
                      final name = nameTextEditController.text.trim();
                      await createProfileControllerNotifier.updateName(name);

                      final description =
                          descriptionTextEditController.text.trim();
                      await createProfileControllerNotifier
                          .updateDescription(description);
                    },
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: 'Name',
                          textEditController: nameTextEditController,
                          textInputAction: TextInputAction.done,
                        ),
                        const SizedBox(
                          height: kSpaceM,
                        ),
                        CustomTextField(
                          hintText: 'Description',
                          textEditController: descriptionTextEditController,
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
                loading: createProfileController.maybeWhen(
                  loading: () => true,
                  orElse: () => false,
                ),
                label: 'Create',
                callback: () {
                  createProfileControllerNotifier.createProfile();
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
