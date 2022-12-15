import 'dart:math';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day15 implements Day {
  @override
  int get dayNumber => 15;

  num y = 2000000;
  num maximumCoordinatesValue = 4000000;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final sensors = puzzleInput.splitPerLine().map((e) => Sensor(e)).toList();

    var minimumXOfSensors = sensors
        .reduce((value, element) => value.position.x < element.position.x ? value : element)
        .position
        .x;
    var maximumXOfSensors = sensors
        .reduce((value, element) => value.position.x > element.position.x ? value : element)
        .position
        .x;

    var count = 0;

    for (var i = minimumXOfSensors - y; i < maximumXOfSensors + y; i++) {
      var point = Point(i, y);

      var sensorsWithSmallerDistanceToPointThanBeacon = sensors.where((sensor) {
        var distance = manhattanDistance(sensor.position, point);
        return distance <= sensor.distance && sensor.beacon != point;
      });

      if (sensorsWithSmallerDistanceToPointThanBeacon.isNotEmpty) {
        count++;
      }
    }

    return count.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final sensors = puzzleInput.splitPerLine().map((e) => Sensor(e)).toList();
    var beacons = sensors.map((e) => e.beacon).toSet();

    for (var sensor in sensors) {
      var interestingPoints = pointsWithDistanceOf(sensor, sensor.distance + 1);

      for (var point in interestingPoints) {
        if (point.x < 0 ||
            point.x > maximumCoordinatesValue ||
            point.y < 0 ||
            point.y > maximumCoordinatesValue) {
          continue;
        }

        var sensorsWithSmallerDistanceToPointThanBeacon = sensors
            .where((element) => manhattanDistance(element.position, point) <= element.distance);

        if (sensorsWithSmallerDistanceToPointThanBeacon.isEmpty && !beacons.contains(point)) {
          var frequency = point.x * 4000000 + point.y;
          return frequency.toString();
        }
      }
    }

    return '';
  }
}

Set<Point<num>> pointsWithDistanceOf(Sensor sensor, num distance) {
  Set<Point> points = {};
  var right = Point(sensor.position.x + distance, sensor.position.y);
  var left = Point(sensor.position.x - distance, sensor.position.y);
  var top = Point(sensor.position.x, sensor.position.y + distance);
  var bottom = Point(sensor.position.x, sensor.position.y - distance);

  var point = right;
  do {
    point = Point(point.x - 1, point.y - 1);
    points.add(point);
  } while (point.x != sensor.position.x);

  point = bottom;
  do {
    point = Point(point.x - 1, point.y + 1);
    points.add(point);
  } while (point.y != sensor.position.y);

  point = left;
  do {
    point = Point(point.x + 1, point.y + 1);
    points.add(point);
  } while (point.x != sensor.position.x);

  point = top;
  do {
    point = Point(point.x + 1, point.y - 1);
    points.add(point);
  } while (point.y != sensor.position.y);

  points.add(right);
  points.add(left);
  points.add(top);
  points.add(bottom);

  return points;
}

num manhattanDistance(Point left, Point right) {
  return (left.x - right.x).abs() + (left.y - right.y).abs();
}

class Sensor {
  late Point position;
  late Point beacon;
  num get distance => manhattanDistance(position, beacon);

  Sensor(String rawSensorBeacon) {
    final parts = rawSensorBeacon.split(':');
    final rawSensor = parts[0].split(',');
    final sensorX = rawSensor[0].split('=').last;
    final sensorY = rawSensor[1].split('=').last;

    final rawBeacon = parts[1].split(',');
    final beaconX = rawBeacon[0].split('=').last;
    final beaconY = rawBeacon[1].split('=').last;

    position = Point(int.parse(sensorX), int.parse(sensorY));
    beacon = Point(int.parse(beaconX), int.parse(beaconY));
  }
}
