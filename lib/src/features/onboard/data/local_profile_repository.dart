import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../domain/profile_model.dart';

class LocalProfileRepository {
  /// Saves the profile to local hiveDb box
  Future<void> saveUP(ProfileModel profile) async {
    print(profile);
  }
}

final localProfileRepositoryProvider = Provider<LocalProfileRepository>((ref) {
  return LocalProfileRepository();
});
