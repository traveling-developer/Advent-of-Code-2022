import 'dart:math';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:vector_math/vector_math.dart';

class Day18 implements Day {
  @override
  int get dayNumber => 18;

  final _neighbors = {
    Vector3(1, 0, 0),
    Vector3(-1, 0, 0),
    Vector3(0, 1, 0),
    Vector3(0, -1, 0),
    Vector3(0, 0, 1),
    Vector3(0, 0, -1),
  };

  final _maximumNeighbors = 6;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final cubes = puzzleInput.splitPerLine().map((e) {
      final coordinates = e.split(',');
      return Vector3(
          double.parse(coordinates[0]), double.parse(coordinates[1]), double.parse(coordinates[2]));
    });

    var result = 0;

    for (var cube in cubes) {
      var numberOfNeighbors = 0;

      for (var element in _neighbors) {
        var possibleNeighbor = cube + element;
        if (cubes.contains(possibleNeighbor)) {
          numberOfNeighbors++;
        }
      }

      result += (_maximumNeighbors - numberOfNeighbors);
    }

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final cubes = puzzleInput.splitPerLine().map((e) {
      final coordinates = e.split(',');
      return Vector3(
          double.parse(coordinates[0]), double.parse(coordinates[1]), double.parse(coordinates[2]));
    });

    final maxX = cubes.map((e) => e.x).reduce(max) + 1;
    final maxY = cubes.map((e) => e.y).reduce(max) + 1;
    final maxZ = cubes.map((e) => e.z).reduce(max) + 1;
    final minX = cubes.map((e) => e.x).reduce(min) - 1;
    final minY = cubes.map((e) => e.y).reduce(min) - 1;
    final minZ = cubes.map((e) => e.z).reduce(min) - 1;

    var result = 0;
    Set<Vector3> cubesToCheck = {Vector3(maxX, maxY, maxZ)};
    Set<Vector3> air = {};

    while (cubesToCheck.isNotEmpty) {
      var cube = cubesToCheck.first;
      cubesToCheck.remove(cube);

      for (var element in _neighbors) {
        var possibleNeighbor = cube + element;
        if (cubes.contains(possibleNeighbor)) {
          result++;
        } else {
          if (!air.contains(possibleNeighbor) &&
              possibleNeighbor.x <= maxX &&
              possibleNeighbor.y <= maxY &&
              possibleNeighbor.z <= maxZ &&
              possibleNeighbor.x >= minX &&
              possibleNeighbor.y >= minY &&
              possibleNeighbor.z >= minZ) {
            cubesToCheck.add(possibleNeighbor);
          } else {
            air.add(cube);
          }
        }
      }
    }

    return result.toString();
  }
}
