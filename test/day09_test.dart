import 'package:adventofcode2022/day09.dart';
import 'package:test/test.dart';

void main() {
  group('day 9', () {
    final puzzleInput = '''R 4
U 4
L 3
D 1
R 4
D 1
L 5
R 2''';

    final largerPuzzleInput = '''R 5
U 8
L 8
D 3
R 17
D 10
L 25
U 20''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('13'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('1'));
    });

    test('solveSecondPuzzle - larger example input - returns expected result', () {
      final day9 = Day9();

      final solution = day9.solveSecondPuzzle(largerPuzzleInput);

      expect(solution, equals('36'));
    });
  });
}
