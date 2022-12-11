import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day11 implements Day {
  @override
  int get dayNumber => 11;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final monkeys = puzzleInput.splitByEmptyLine().map((e) => Monkey(e)).toList();

    worryLevelCalculation(int worryLevel) => worryLevel ~/ 3;

    for (var i = 0; i < 20; i++) {
      processTurn(monkeys, worryLevelCalculation);
    }

    monkeys.sort((a, b) => a.numberOfInspections.compareTo(b.numberOfInspections));

    final result =
        monkeys.last.numberOfInspections * monkeys[monkeys.length - 2].numberOfInspections;

    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final monkeys = puzzleInput.splitByEmptyLine().map((e) => Monkey(e)).toList();

    final divider = monkeys.map((e) => e.divisibleBy).reduce((value, element) => value * element);
    worryLevelCalculation(int worryLevel) => worryLevel % divider;

    for (var i = 0; i < 10000; i++) {
      processTurn(monkeys, worryLevelCalculation);
    }

    monkeys.sort((a, b) => a.numberOfInspections.compareTo(b.numberOfInspections));

    final result =
        monkeys.last.numberOfInspections * monkeys[monkeys.length - 2].numberOfInspections;

    return result.toString();
  }

  void processTurn(List<Monkey> monkeys, int Function(int worryLevel) worryLevelCalculation) {
    for (var monkey in monkeys) {
      for (var item in monkey.items) {
        monkey.numberOfInspections++;
        var worryLevel = monkey.inspect(item);
        worryLevel = worryLevelCalculation(worryLevel);
        var test = monkey.test(worryLevel);
        if (test == true) {
          monkeys
              .singleWhere((element) => element.number == monkey.trueMonkey)
              .items
              .add(worryLevel);
        } else {
          monkeys
              .singleWhere((element) => element.number == monkey.falseMonkey)
              .items
              .add(worryLevel);
        }
      }
      monkey.items.clear();
    }
  }
}

class Monkey {
  late int number;
  List<int> items = [];
  late String operator;
  late String operant;
  late int divisibleBy;
  late int trueMonkey;
  late int falseMonkey;
  int numberOfInspections = 0;

  Monkey(String rawMonkey) {
    final monkeyParts = rawMonkey.splitPerLine().toList();

    number = int.parse(monkeyParts[0].split(' ').last.replaceAll(':', ''));
    items = monkeyParts[1]
        .trim()
        .split(' ')
        .sublist(2)
        .map((e) => int.parse(e.replaceAll(',', '')))
        .toList();
    final operationParts = monkeyParts[2].split(' ');
    operator = operationParts[operationParts.length - 2];
    operant = operationParts.last;

    divisibleBy = int.parse(monkeyParts[3].split(' ').last);
    trueMonkey = int.parse(monkeyParts[4].split(' ').last);
    falseMonkey = int.parse(monkeyParts[5].split(' ').last);
  }

  int inspect(int item) {
    int currentOperant = 0;
    if (operant == 'old') {
      currentOperant = item;
    } else {
      currentOperant = int.parse(operant);
    }

    if (operator == '*') {
      return item * currentOperant;
    }
    if (operator == '+') {
      return item + currentOperant;
    }

    throw Error();
  }

  bool test(int item) {
    return item % divisibleBy == 0;
  }
}
