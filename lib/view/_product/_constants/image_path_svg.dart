class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths? get instance {
    _instace ??= SVGImagePaths._init();
    return _instace;
  }

  SVGImagePaths._init();

  final onboardSVG1 = "onboard_1".toSVG;
  final onboardSVG2 = "onboard_2".toSVG;
  final onboardSVG3 = "onboard_3".toSVG;
}

extension _SVGPATH on String {
  String get toSVG => "assets/svg/$this.svg";
}
