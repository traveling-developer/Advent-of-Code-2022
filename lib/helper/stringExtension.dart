extension StringSplitting on String {
  Iterable<String> splitPerLine() {
    return split('\n').where((element) => element.isNotEmpty);
  }

  Iterable<String> splitByEmptyLine() {
    return split('\n\n').where((element) => element.isNotEmpty);
  }
}
