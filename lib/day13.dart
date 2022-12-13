import 'dart:convert';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day13 implements Day {
  @override
  int get dayNumber => 13;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final pairs = puzzleInput
        .splitByEmptyLine()
        .map((e) => e.splitPerLine().map<dynamic>((e) => jsonDecode(e)))
        .toList();

    var sumOfRightOrderedIndices = 0;

    for (var element in pairs.asMap().entries) {
      var pair = element.value;

      var leftPacket = pair.first as List<dynamic>;
      var rightPacket = pair.last as List<dynamic>;

      var packetsInRightOrder = rightOrder(leftPacket, rightPacket);
      if (packetsInRightOrder == Result.right) {
        sumOfRightOrderedIndices += (element.key + 1);
      }
    }

    return sumOfRightOrderedIndices.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var divider = rawDivider
        .splitPerLine()
        .map<List<dynamic>>((e) => jsonDecode(e) as List<dynamic>)
        .toList();
    final pairs = puzzleInput
        .splitPerLine()
        .map<List<dynamic>>((e) => jsonDecode(e) as List<dynamic>)
        .toList();

    pairs.addAll(divider);

    pairs.sort((List<dynamic> a, List<dynamic> b) {
      if (rightOrder(a, b) == Result.wrong) {
        return 1;
      }
      return -1;
    });

    var indexOfFirstDivider = pairs.indexOf(divider.first);
    var indexOfSecondDivider = pairs.indexOf(divider.last);
    var result = (indexOfFirstDivider + 1) * (indexOfSecondDivider + 1);

    return result.toString();
  }

  var rawDivider = '''[[2]]
[[6]]''';

  Result rightOrder(List<dynamic> left, List<dynamic> right) {
    for (var element in left.asMap().entries) {
      if (right.length < element.key + 1) {
        return Result.wrong;
      }

      dynamic leftElement = element.value;
      dynamic rightElement = right.elementAt(element.key);

      if (leftElement is int && rightElement is int) {
        if (rightElement < leftElement) {
          return Result.wrong;
        }
        if (rightElement > leftElement) {
          return Result.right;
        }
      } else {
        var result = Result.none;

        if (leftElement is List && rightElement is List) {
          result = rightOrder(leftElement, rightElement);
        } else if (leftElement is int && rightElement is List) {
          result = rightOrder(<dynamic>[leftElement], rightElement);
        } else if (leftElement is List && rightElement is int) {
          result = rightOrder(leftElement, <dynamic>[rightElement]);
        }

        if (result != Result.none) {
          return result;
        }
      }
    }
    if (right.length > left.length) {
      return Result.right;
    }
    return Result.none;
  }
}

enum Result { right, wrong, none }
