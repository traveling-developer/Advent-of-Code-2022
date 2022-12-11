import 'dart:math';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day9 implements Day {
  @override
  int get dayNumber => 9;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final headMovements = parseHeadMovementsAsPoints(puzzleInput);

    Point head = const Point(0, 0);
    Point tail = const Point(0, 0);
    List<Point> tailPositions = [tail];

    for (var movement in headMovements) {
      head = moveHead(movement, head);

      tail = moveTail(head, tail);

      if (!tailPositions.contains(tail)) {
        tailPositions.add(tail);
      }
    }

    return tailPositions.length.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final headMovements = parseHeadMovementsAsPoints(puzzleInput);

    Point head = const Point(0, 0);
    List<Point> tails = List.filled(9, const Point(0, 0));
    List<Point> tailPositions = [tails.last];

    for (var movements in headMovements) {
      head = moveHead(movements, head);

      tails[0] = moveTail(head, tails.first);

      for (var i = 1; i < tails.length; i++) {
        final tail = tails[i];
        var newTail = moveTail(tails[i - 1], tail);
        tails[i] = newTail;
      }

      if (!tailPositions.contains(tails.last)) {
        tailPositions.add(tails.last);
      }
    }

    return tailPositions.length.toString();
  }
}

Iterable<Point> parseHeadMovementsAsPoints(String puzzleInput) {
  return puzzleInput.splitPerLine().map((e) {
    final parts = e.split(' ');
    final directions = List.filled(int.parse(parts[1]), movementAsPoint(parts[0]));
    return directions;
  }).expand((element) => element);
}

Point movementAsPoint(String rawDirection) {
  if (rawDirection == 'U') {
    return const Point(0, 1);
  }
  if (rawDirection == 'D') {
    return const Point(0, -1);
  }
  if (rawDirection == 'R') {
    return const Point(1, 0);
  }
  if (rawDirection == 'L') {
    return const Point(-1, 0);
  }
  throw ArgumentError();
}

Point<num> moveHead(Point direction, Point<num> head) {
  return head + direction;
}

Point moveTail(Point head, Point tail) {
  num x = tail.x;
  num y = tail.y;

  var difference = head - tail;

  if (difference.x.abs() <= 1 && difference.y.abs() <= 1) {
    return tail;
  }

  x += difference.x.sign;
  y += difference.y.sign;

  return Point(x, y);
}
