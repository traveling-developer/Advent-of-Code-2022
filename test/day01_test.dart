import 'package:adventofcode2022/day01.dart';
import 'package:test/test.dart';

void main() {
  group('day 1', () {
    final puzzleInput = '''1000
2000
3000

4000

5000
6000

7000
8000
9000

10000''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day1 = Day1();

      final solution = day1.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('24000'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day1 = Day1();

      final solution = day1.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('45000'));
    });
  });
}
