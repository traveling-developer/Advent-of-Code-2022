import 'package:adventofcode2022/day21.dart';
import 'package:test/test.dart';

void main() {
  group('day 21', () {
    final puzzleInput = '''root: pppw + sjmn
dbpl: 5
cczh: sllz + lgvd
zczc: 2
ptdq: humn - dvpt
dvpt: 3
lfqf: 4
humn: 5
ljgn: 2
sjmn: drzm * dbpl
sllz: 4
pppw: cczh / lfqf
lgvd: ljgn * ptdq
drzm: hmdt - zczc
hmdt: 32''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day21 = Day21();

      final solution = day21.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('152'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day21 = Day21();

      final solution = day21.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('301'));
    });
  });
}
