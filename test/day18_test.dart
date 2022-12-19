import 'package:adventofcode2022/day18.dart';
import 'package:test/test.dart';

void main() {
  group('day 18', () {
    final puzzleInput = '''2,2,2
1,2,2
3,2,2
2,1,2
2,3,2
2,2,1
2,2,3
2,2,4
2,2,6
1,2,5
3,2,5
2,1,5
2,3,5''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day18 = Day18();

      final solution = day18.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('64'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day18 = Day18();

      final solution = day18.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('58'));
    });
  });
}
