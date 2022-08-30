import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/local_profile_repository.dart';
import '../../domain/profile_model.dart';

class ImportProfileControllerNotifier
    extends StateNotifier<AsyncValue<ProfileModel>> {
  ImportProfileControllerNotifier({required this.ref})
      : super(
          const AsyncData(
            ProfileModel(
              universalProfile: '',
              privateKey: '',
            ),
          ),
        ) {
    localProfileRepository = ref.watch(localProfileRepositoryProvider);
  }

  final Ref ref;
  late final LocalProfileRepository localProfileRepository;

  Future<void> updateUniversalProfile(String universalProfile) async {
    state = await AsyncValue.guard(() async {
      final stateData = state.value!.copyWith(
        universalProfile: universalProfile,
      );
      return stateData;
    });
  }

  Future<void> updatePrivateKey(String privateKey) async {
    state = await AsyncValue.guard(() async {
      final stateData = state.value!.copyWith(privateKey: privateKey);
      return stateData;
    });
  }

  Future<void> importProfile() async {
    if (state.value!.privateKey == '' && state.value!.universalProfile == '') {
      return;
    }
    final stateData = state.value!;
    state = const AsyncLoading();
    await localProfileRepository.saveUP(stateData);
  }
}

final importProfileControllerProvider = StateNotifierProvider<
    ImportProfileControllerNotifier, AsyncValue<ProfileModel>>((ref) {
  return ImportProfileControllerNotifier(ref: ref);
});
