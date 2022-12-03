import 'package:adventofcode2022/day02.dart';
import 'package:test/test.dart';

void main() {
  group('day 2', () {
    final puzzleInput = '''A Y
B X
C Z''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day2 = Day2();

      final solution = day2.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('15'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day2 = Day2();

      final solution = day2.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('12'));
    });
  });
}
