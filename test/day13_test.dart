import 'package:adventofcode2022/day13.dart';
import 'package:test/test.dart';

void main() {
  group('day 13', () {
    final puzzleInput = '''[1,1,3,1,1]
[1,1,5,1,1]

[[1],[2,3,4]]
[[1],4]

[9]
[[8,7,6]]

[[4,4],4,4]
[[4,4],4,4,4]

[7,7,7,7]
[7,7,7]

[]
[3]

[[[]]]
[[]]

[1,[2,[3,[4,[5,6,7]]]],8,9]
[1,[2,[3,[4,[5,6,0]]]],8,9]''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day13 = Day13();

      final solution = day13.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('13'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day13 = Day13();

      final solution = day13.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('140'));
    });
  });
}
