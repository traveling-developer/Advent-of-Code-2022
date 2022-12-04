import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day4 implements Day {
  @override
  int get dayNumber => 4;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final pairs = puzzleInput.splitPerLine().map((e) => Pair(e));

    var result = pairs.where((element) => element.fullyContains());

    return result.length.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final pairs = puzzleInput.splitPerLine().map((e) => Pair(e));

    var result = pairs.where((element) => element.overlap());

    return result.length.toString();
  }
}

class Pair {
  late Set<num> first;
  late Set<num> second;

  Pair(String rawPair) {
    final rawParts = rawPair.split(',');
    first = _parsePart(rawParts[0]);
    second = _parsePart(rawParts[1]);
  }

  bool fullyContains() {
    return first.containsAll(second) || second.containsAll(first);
  }

  bool overlap() {
    return first.intersection(second).isNotEmpty;
  }

  Set<num> _parsePart(String rawPart) {
    final startAndEndOfSections = rawPart.split('-');

    Set<num> part = {};

    for (var i = num.parse(startAndEndOfSections.first);
        i <= num.parse(startAndEndOfSections.last);
        i++) {
      part.add(i);
    }

    return part;
  }
}
