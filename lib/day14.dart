import 'dart:math';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:quiver/iterables.dart' as quiver;

class Day14 implements Day {
  @override
  int get dayNumber => 14;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final rockPaths = puzzleInput.splitPerLine().map((e) => e.split(' -> ').map((e) {
          var pointParts = e.split(',');
          return Point(int.parse(pointParts.first), int.parse(pointParts.last));
        }));

    var rocks = getRocksFromPaths(rockPaths);
    var yMaximum = rocks.map((e) => e.y).reduce(max);

    var sandCounter = simulateFlowingSand(rocks, yMaximum);

    return sandCounter.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final paths = puzzleInput.splitPerLine().map((e) => e.split(' -> ').map((e) {
          var pointParts = e.split(',');
          return Point(int.parse(pointParts.first), int.parse(pointParts.last));
        }));

    var rocks = getRocksFromPaths(paths);
    var yMaximum = rocks.map((e) => e.y).reduce(max) + 2;

    fillRocksWithFloor(rocks, yMaximum);

    var sandCounter = simulateFlowingSand(rocks, yMaximum);

    return sandCounter.toString();
  }

  void fillRocksWithFloor(Set<Point<num>> rocks, num yMaximum) {
    for (var element in quiver.range(-1000, 1000, 1)) {
      rocks.add(Point(element, yMaximum));
    }
  }

  int simulateFlowingSand(Set<Point<num>> rocks, num yMaximum) {
    var sandCounter = 0;
    var pouringPoint = const Point(500, 0);

    var flowingSand = pouringPoint;

    while (true) {
      if (rocks.contains(pouringPoint) || flowingSand.y >= yMaximum) {
        break;
      }
      if (!rocks.contains(Point(flowingSand.x, flowingSand.y + 1))) {
        flowingSand = Point(flowingSand.x, flowingSand.y + 1);
        continue;
      } else {
        if (!rocks.contains(Point(flowingSand.x - 1, flowingSand.y + 1))) {
          flowingSand = Point(flowingSand.x - 1, flowingSand.y + 1);
          continue;
        } else if (!rocks.contains(Point(flowingSand.x + 1, flowingSand.y + 1))) {
          flowingSand = Point(flowingSand.x + 1, flowingSand.y + 1);
          continue;
        } else {
          rocks.add(flowingSand);
          flowingSand = pouringPoint;
          sandCounter++;

          continue;
        }
      }
    }

    return sandCounter;
  }

  Set<Point> getRocksFromPaths(Iterable<Iterable<Point<int>>> rockPaths) {
    Set<Point> rocks = {};

    for (var path in rockPaths) {
      for (var i = 0; i < path.length - 1; i++) {
        var start = path.elementAt(i);
        var end = path.elementAt(i + 1);

        rocks.add(start);
        rocks.add(end);
        Iterable<num> rocksBetween = [];

        if (start.x == end.x) {
          if (start.y < end.y) {
            rocksBetween = quiver.range(start.y, end.y, 1);
          } else {
            rocksBetween = quiver.range(start.y, end.y, -1);
          }
          for (var element in rocksBetween) {
            rocks.add(Point(start.x, element));
          }
        } else if (start.y == end.y) {
          if (start.x < end.x) {
            rocksBetween = quiver.range(start.x, end.x, 1);
          } else {
            rocksBetween = quiver.range(start.x, end.x, -1);
          }
          for (var element in rocksBetween) {
            rocks.add(Point(element, start.y));
          }
        }
      }
    }

    return rocks;
  }
}
