import 'package:adventofcode2022/day14.dart';
import 'package:test/test.dart';

void main() {
  group('day 14', () {
    final puzzleInput = '''498,4 -> 498,6 -> 496,6
503,4 -> 502,4 -> 502,9 -> 494,9''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day14 = Day14();

      final solution = day14.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('24'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day14 = Day14();

      final solution = day14.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('93'));
    });
  });
}
