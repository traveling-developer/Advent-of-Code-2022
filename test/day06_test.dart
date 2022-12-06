import 'package:adventofcode2022/day06.dart';
import 'package:test/test.dart';

void main() {
  group('day 6', () {
    final firstPuzzleInput = '''mjqjpqmgbljsphdztnvjfqwrcgsmlb''';
    final secondPuzzleInput = '''bvwbjplbgvbhsrlpgdmjqwftvncz''';
    final thirdPuzzleInput = '''nppdvjthqldpwncqszvftbrmjlhg''';
    final fourthPuzzleInput = '''nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg''';
    final fifthPuzzleInput = '''zcfzfwzzqfrljwzlrfnpqdbhtmscgvjw''';

    test('solveFirstPuzzle - first example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveFirstPuzzle(firstPuzzleInput);

      expect(solution, equals('7'));
    });

    test('solveFirstPuzzle - second example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveFirstPuzzle(secondPuzzleInput);

      expect(solution, equals('5'));
    });

    test('solveFirstPuzzle - third example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveFirstPuzzle(thirdPuzzleInput);

      expect(solution, equals('6'));
    });

    test('solveFirstPuzzle - fourth example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveFirstPuzzle(fourthPuzzleInput);

      expect(solution, equals('10'));
    });

    test('solveFirstPuzzle - fifth example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveFirstPuzzle(fifthPuzzleInput);

      expect(solution, equals('11'));
    });

    test('solveSecondPuzzle - first example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveSecondPuzzle(firstPuzzleInput);

      expect(solution, equals('19'));
    });

    test('solveSecondPuzzle - second example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveSecondPuzzle(secondPuzzleInput);

      expect(solution, equals('23'));
    });

    test('solveSecondPuzzle - third example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveSecondPuzzle(thirdPuzzleInput);

      expect(solution, equals('23'));
    });

    test('solveSecondPuzzle - fourth example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveSecondPuzzle(fourthPuzzleInput);

      expect(solution, equals('29'));
    });

    test('solveSecondPuzzle - fifth example input - returns expected result', () {
      final day6 = Day6();

      final solution = day6.solveSecondPuzzle(fifthPuzzleInput);

      expect(solution, equals('26'));
    });
  });
}
