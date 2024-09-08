extension StringExtension on String {
  String? getLastUrlPath() {
    if (isNotEmpty) {
      var url = Uri.parse(this);
      return url.pathSegments[url.pathSegments.length - 2];
    }
    return null;
  }
}
