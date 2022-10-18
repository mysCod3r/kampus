class SVGImagePaths {
  static SVGImagePaths? _instace;
  static SVGImagePaths? get instance {
    _instace ??= SVGImagePaths._init();
    return _instace;
  }

  SVGImagePaths._init();

  final String onboardSVG1 = "onboard_1".toSVG;
  final String onboardSVG2 = "onboard_2".toSVG;
  final String onboardSVG3 = "onboard_3".toSVG;
  final String party = "party".toSVG;
}

extension _SVGPATH on String {
  String get toSVG => "assets/svg/$this.svg";
}
