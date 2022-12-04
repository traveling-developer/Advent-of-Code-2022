import 'package:adventofcode2022/day04.dart';
import 'package:test/test.dart';

void main() {
  group('day 4', () {
    final puzzleInput = '''2-4,6-8
2-3,4-5
5-7,7-9
2-8,3-7
6-6,4-6
2-6,4-8
77-78,99-99''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day4 = Day4();

      final solution = day4.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('2'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day4 = Day4();

      final solution = day4.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('4'));
    });
  });
}
