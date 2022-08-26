// class SignInScreenController extends StateNotifier<AsyncValue<void>> {
//   SignInScreenController({required this.authRepository})
//       : super(const AsyncData<void>(null));
//   final AuthRepository authRepository;

//   Future<void> signInAnonymously() async {
//     state = const AsyncLoading<void>();
//     state = await AsyncValue.guard<void>(authRepository.signInAnonymously);
//   }
// }

// final signInScreenControllerProvider =
//     StateNotifierProvider.autoDispose<SignInScreenController, AsyncValue<void>>(
//   (ref) {
//     return SignInScreenController(
//       authRepository: ref.watch(authRepositoryProvider),
//     );
//   },
// );
