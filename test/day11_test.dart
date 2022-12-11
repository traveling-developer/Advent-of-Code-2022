import 'package:adventofcode2022/day11.dart';
import 'package:test/test.dart';

void main() {
  group('day 11', () {
    final puzzleInput = '''Monkey 0:
  Starting items: 79, 98
  Operation: new = old * 19
  Test: divisible by 23
    If true: throw to monkey 2
    If false: throw to monkey 3

Monkey 1:
  Starting items: 54, 65, 75, 74
  Operation: new = old + 6
  Test: divisible by 19
    If true: throw to monkey 2
    If false: throw to monkey 0

Monkey 2:
  Starting items: 79, 60, 97
  Operation: new = old * old
  Test: divisible by 13
    If true: throw to monkey 1
    If false: throw to monkey 3

Monkey 3:
  Starting items: 74
  Operation: new = old + 3
  Test: divisible by 17
    If true: throw to monkey 0
    If false: throw to monkey 1''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day11 = Day11();

      final solution = day11.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('10605'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day11 = Day11();

      final solution = day11.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('2713310158'));
    });
  });
}
