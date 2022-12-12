import 'dart:math';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:graphs/graphs.dart';

const int intMax64 = 0x7fffffffffffffff;

class Day12 implements Day {
  @override
  int get dayNumber => 12;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final rawHeightMap =
        puzzleInput.splitPerLine().map((e) => e.split('').map((e) => charToHeight(e))).toList();

    Map<Point<num>, int> heightMap = createHeightMap(rawHeightMap);
    final startingPoint = heightMap.entries.singleWhere((element) => element.value == 0).key;
    final endPoint = heightMap.entries.singleWhere((element) => element.value == 27).key;

    final graphMap = createGraphMap(heightMap);

    var path = shortestPath(startingPoint, endPoint, (point) => graphMap[point]!);

    return path!.length.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final rawHeightMap =
        puzzleInput.splitPerLine().map((e) => e.split('').map((e) => charToHeight(e))).toList();

    Map<Point<num>, int> heightMap = createHeightMap(rawHeightMap);
    final startingPoints = heightMap.entries
        .where((element) => element.value == 0 || element.value == 1)
        .map((e) => e.key);
    final endPoint = heightMap.entries.singleWhere((element) => element.value == 27).key;

    final graphMap = createGraphMap(heightMap);

    List<int> lengthOfPaths = [];
    for (var startingPoint in startingPoints) {
      var path = shortestPath(startingPoint, endPoint, (p0) => graphMap[p0]!);

      if (path != null) {
        lengthOfPaths.add(path.length);
      }
    }

    lengthOfPaths.sort();

    return lengthOfPaths.first.toString();
  }
}

int charToHeight(String char) {
  if (char == 'S') {
    return 0;
  } else if (char == 'E') {
    return 27;
  } else {
    return char.codeUnitAt(0) - 96;
  }
}

Map<Point<num>, int> createHeightMap(List<Iterable<int>> rawHeightMap) {
  Map<Point, int> heightMap = {};

  for (var i = 0; i < rawHeightMap.length; i++) {
    for (var j = 0; j < rawHeightMap.first.length; j++) {
      heightMap.putIfAbsent(Point(j, i), () => rawHeightMap.elementAt(i).elementAt(j));
    }
  }
  return heightMap;
}

Map<Point<num>, List<Point<num>>> createGraphMap(Map<Point<num>, int> heightMap) {
  Map<Point, List<Point>> graphMap = {};

  for (var point in heightMap.keys) {
    graphMap.putIfAbsent(point, () => []);

    var currentHeight = heightMap[point]!;

    var neighborPoints = getNeighborPoints(point);
    for (var neighbor in neighborPoints) {
      if (!heightMap.containsKey(neighbor)) {
        continue;
      }

      var neighborHeight = heightMap[neighbor]!;
      if (neighborHeight <= currentHeight || currentHeight + 1 == neighborHeight) {
        graphMap[point]!.add(neighbor);
      }
    }
  }

  return graphMap;
}

List<Point<num>> getNeighborPoints(Point<num> firstItem) {
  List<Point<num>> neighborPoints = [];

  neighborPoints.add(Point(firstItem.x + 1, firstItem.y));
  neighborPoints.add(Point(firstItem.x - 1, firstItem.y));
  neighborPoints.add(Point(firstItem.x, firstItem.y + 1));
  neighborPoints.add(Point(firstItem.x, firstItem.y - 1));

  return neighborPoints;
}
