import 'package:flutter/cupertino.dart';

import '../../../_product/_constants/image_path_svg.dart';
import '../model/onboard_model.dart';

class OnboardViewModel extends ChangeNotifier {
  final List<OnboardModel> onboardItems = [
    OnboardModel("BAŞLIK1", "açiklama1" * 50, SVGImagePaths.instance!.onboardSVG1),
    OnboardModel("BAŞLIK2", "açiklama2" * 50, SVGImagePaths.instance!.onboardSVG2),
    OnboardModel("BAŞLIK3", "açiklama3" * 50, SVGImagePaths.instance!.onboardSVG3)
  ];

  int currentIndex = 0;

  void changeIndex() {
    currentIndex += 1;
    notifyListeners();
  }
}
