import 'package:adventofcode2022/day03.dart';
import 'package:test/test.dart';

void main() {
  group('day 3', () {
    final puzzleInput = '''vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day3 = Day3();

      final solution = day3.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('157'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day3 = Day3();

      final solution = day3.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('70'));
    });
  });
}
