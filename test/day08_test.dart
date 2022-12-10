import 'package:adventofcode2022/day08.dart';
import 'package:test/test.dart';

void main() {
  group('day 8', () {
    final puzzleInput = '''30373
25512
65332
33549
35390''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day8 = Day8();

      final solution = day8.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('21'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day8 = Day8();

      final solution = day8.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('8'));
    });
  });
}
