import 'package:adventofcode2022/day15.dart';
import 'package:test/test.dart';

void main() {
  group('day 15', () {
    final puzzleInput = '''Sensor at x=2, y=18: closest beacon is at x=-2, y=15
Sensor at x=9, y=16: closest beacon is at x=10, y=16
Sensor at x=13, y=2: closest beacon is at x=15, y=3
Sensor at x=12, y=14: closest beacon is at x=10, y=16
Sensor at x=10, y=20: closest beacon is at x=10, y=16
Sensor at x=14, y=17: closest beacon is at x=10, y=16
Sensor at x=8, y=7: closest beacon is at x=2, y=10
Sensor at x=2, y=0: closest beacon is at x=2, y=10
Sensor at x=0, y=11: closest beacon is at x=2, y=10
Sensor at x=20, y=14: closest beacon is at x=25, y=17
Sensor at x=17, y=20: closest beacon is at x=21, y=22
Sensor at x=16, y=7: closest beacon is at x=15, y=3
Sensor at x=14, y=3: closest beacon is at x=15, y=3
Sensor at x=20, y=1: closest beacon is at x=15, y=3
''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day15 = Day15();
      day15.y = 10;

      final solution = day15.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('26'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day15 = Day15();
      day15.maximumCoordinatesValue = 20;

      final solution = day15.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('56000011'));
    });
  });
}
