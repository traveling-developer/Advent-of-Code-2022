import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/stringExtension.dart';
import 'package:collection/collection.dart';

class Day1 implements Day {
  @override
  int get dayNumber => 1;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final elves = puzzleInput.splitByEmptyLine().map((e) => Elf(e)).toList();

    elves.sortBy<num>((element) => element.totalFoodCalories());

    return elves.last.totalFoodCalories().toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final elves = puzzleInput.splitByEmptyLine().map((e) => Elf(e)).toList();

    elves.sortBy<num>((element) => element.totalFoodCalories());

    var result = elves[elves.length - 1].totalFoodCalories() +
        elves[elves.length - 2].totalFoodCalories() +
        elves[elves.length - 3].totalFoodCalories();

    return result.toString();
  }
}

class Elf {
  Elf(String rawFoodCalories) {
    foodCalories = rawFoodCalories.splitPerLine().map((e) => int.parse(e)).toList();
  }

  List<int> foodCalories = [];

  int totalFoodCalories() {
    return foodCalories.sum;
  }
}
