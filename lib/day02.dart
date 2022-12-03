import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day2 implements Day {
  @override
  int get dayNumber => 2;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final games = puzzleInput.splitPerLine().map((e) => Game.firstGameVersion(e));

    var totalScore = games.map((e) => e.getScore()).toList().sum;

    return totalScore.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final games = puzzleInput.splitPerLine().map((e) => Game.secondGameVersion(e));

    var totalScore = games.map((e) => e.getScore()).toList().sum;

    return totalScore.toString();
  }
}

enum Shape {
  rock(1),
  paper(2),
  scissor(3);

  const Shape(this.value);
  final int value;
}

Map<String, Shape> shapeLookupTable = {
  'A': Shape.rock,
  'B': Shape.paper,
  'C': Shape.scissor,
  'X': Shape.rock,
  'Y': Shape.paper,
  'Z': Shape.scissor
};

class Game {
  Game();

  late Shape player;
  late Shape opponent;

  factory Game.firstGameVersion(String rawInput) {
    return Game()
      ..opponent = shapeLookupTable[rawInput[0]]!
      ..player = shapeLookupTable[rawInput[2]]!;
  }

  factory Game.secondGameVersion(String rawInput) {
    final currentGame = Game()..opponent = shapeLookupTable[rawInput[0]]!;

    if (rawInput[2] == 'X') {
      _playerShouldLose(currentGame);
    }
    if (rawInput[2] == 'Y') {
      _gameShouldBeADraw(currentGame);
    }
    if (rawInput[2] == 'Z') {
      _playerShouldWin(currentGame);
    }

    return currentGame;
  }

  bool playerHasWon() {
    if ((player == Shape.paper && opponent == Shape.rock) ||
        (player == Shape.rock && opponent == Shape.scissor) ||
        (player == Shape.scissor && opponent == Shape.paper)) {
      return true;
    }

    return false;
  }

  bool isDraw() {
    return player == opponent;
  }

  int getScore() {
    int score = 0;
    score += player.value;

    if (playerHasWon()) {
      score += 6;
    } else if (isDraw()) {
      score += 3;
    }

    return score;
  }

  static void _playerShouldWin(Game currentGame) {
    if (currentGame.opponent == Shape.paper) {
      currentGame.player = Shape.scissor;
    }
    if (currentGame.opponent == Shape.rock) {
      currentGame.player = Shape.paper;
    }
    if (currentGame.opponent == Shape.scissor) {
      currentGame.player = Shape.rock;
    }
  }

  static void _gameShouldBeADraw(Game currentGame) {
    currentGame.player = currentGame.opponent;
  }

  static void _playerShouldLose(Game currentGame) {
    if (currentGame.opponent == Shape.paper) {
      currentGame.player = Shape.rock;
    }
    if (currentGame.opponent == Shape.rock) {
      currentGame.player = Shape.scissor;
    }
    if (currentGame.opponent == Shape.scissor) {
      currentGame.player = Shape.paper;
    }
  }
}
