class IconPath {
  static IconPath? _instace;
  static IconPath? get instance {
    _instace ??= IconPath._init();
    return _instace;
  }

  IconPath._init();

  final String twitter = "ic_twitter".toSVG;
}

extension _ICONPATH on String {
  String get toSVG => "assets/icon/$this.png";
}
