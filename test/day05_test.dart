import 'package:adventofcode2022/day05.dart';
import 'package:test/test.dart';

void main() {
  group('day 5', () {
    final puzzleInput = '''    [D]    
[N] [C]    
[Z] [M] [P]
 1   2   3 

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day5 = Day5();

      final solution = day5.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('CMZ'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day5 = Day5();

      final solution = day5.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('MCD'));
    });
  });
}
