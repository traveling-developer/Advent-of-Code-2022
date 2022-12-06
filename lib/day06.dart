import 'package:adventofcode2022/day.dart';

class Day6 implements Day {
  @override
  int get dayNumber => 6;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final startOfPacketMarker = getStartOfMarker(puzzleInput, 4);

    return startOfPacketMarker.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final startOfMessageMarker = getStartOfMarker(puzzleInput, 14);

    return startOfMessageMarker.toString();
  }

  int getStartOfMarker(String puzzleInput, int numberOfDistinctCharacters) {
    int startOfMarker = 0;

    for (var i = 0; i < puzzleInput.length; i++) {
      var endOfCurrentSequence = i + numberOfDistinctCharacters;

      var characterSequence = puzzleInput.substring(i, endOfCurrentSequence);

      var numberOfUniqueCharacters = characterSequence.split('').toSet().length;

      if (numberOfUniqueCharacters == numberOfDistinctCharacters) {
        startOfMarker = i + numberOfDistinctCharacters;
        break;
      }
    }
    return startOfMarker;
  }
}
