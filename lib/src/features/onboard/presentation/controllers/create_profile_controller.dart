import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/remote_profile_repository.dart';
import '../../domain/create_profile_model.dart';

class CreateProfileControllerNotifier
    extends StateNotifier<AsyncValue<CreateProfileModel>> {
  CreateProfileControllerNotifier({required this.ref})
      : super(
          AsyncData(
            CreateProfileModel(description: '', name: ''),
          ),
        ) {
    remoteProfileRepository = ref.watch(remoteProfileRepositoryProvider);
  }

  final Ref ref;
  late final RemoteProfileRepository remoteProfileRepository;

  /// Update profile name.
  Future<void> updateName(String name) async {
    state = await AsyncValue.guard(() async {
      final stateData = state.value!.copyWith(name: name);
      return stateData;
    });
  }

  /// Update profile description.
  Future<void> updateDescription(String description) async {
    state = await AsyncValue.guard(() async {
      final stateData = state.value!.copyWith(description: description);
      return stateData;
    });
  }

  /// Create new profile.
  Future<void> createProfile() async {
    if (state.value!.name == '') return;
    await remoteProfileRepository.createUP(state.value!);
    state = const AsyncLoading();
  }
}

final createProfileControllerProvider = StateNotifierProvider<
    CreateProfileControllerNotifier, AsyncValue<CreateProfileModel>>(
  (ref) {
    return CreateProfileControllerNotifier(ref: ref);
  },
);
