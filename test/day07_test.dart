import 'package:adventofcode2022/day07.dart';
import 'package:test/test.dart';

void main() {
  group('day 7', () {
    final puzzleInput = '''\$ cd /
\$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
\$ cd a
\$ ls
dir e
29116 f
2557 g
62596 h.lst
\$ cd e
\$ ls
584 i
\$ cd ..
\$ cd ..
\$ cd d
\$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k''';

    test('solveFirstPuzzle - example input - returns expected result', () {
      final day7 = Day7();

      final solution = day7.solveFirstPuzzle(puzzleInput);

      expect(solution, equals('95437'));
    });

    test('solveSecondPuzzle - example input - returns expected result', () {
      final day7 = Day7();

      final solution = day7.solveSecondPuzzle(puzzleInput);

      expect(solution, equals('24933642'));
    });
  });
}
