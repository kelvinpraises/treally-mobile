import 'app_features_model.dart';

class OnboardModel {
  OnboardModel({
    required this.index,
    required this.appFeatures,
    required this.resetFeatures,
  });

  final int index;
  final List<AppFeatures> appFeatures;
  final bool resetFeatures;
}
