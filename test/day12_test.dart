import 'package:adventofcode2022/day12.dart';
import 'package:test/test.dart';

void main() {
  group('day 12 ', () {
    final puzzleInput = '''Sabqponm
abcryxxl
accszExk
acctuvwj
abdefghi''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day12 = Day12();

      final solution = day12.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('31'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day12 = Day12();

      final solution = day12.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('29'));
    });
  });
}
