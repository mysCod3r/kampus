abstract class INavigationService {
  Future<void> navigateToPage({String? path, Object? data, int? tabIndex});
  Future<void> navigateToPageClear({String? path, Object? data, int? tabIndex});
  Future<void> navigateToPageReplace({String? path, Object? data, int? tabIndex});
}
