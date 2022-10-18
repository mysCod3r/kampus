class RegexValidate {
  static RegexValidate? _instace;
  static RegexValidate? get instance {
    _instace ??= RegexValidate._init();
    return _instace;
  }

  RegexValidate._init();

  final RegExp uniMail = RegExp(r'(^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.+-]+\.edu\.tr$)');
}
