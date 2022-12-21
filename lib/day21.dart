import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day21 implements Day {
  @override
  int get dayNumber => 21;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final monkeys = puzzleInput.splitPerLine().map((e) => Monkey(e)).toList();
    final monkeysMap = Map<String, Monkey>.fromIterable(monkeys,
        key: ((dynamic element) => (element as Monkey).name));

    var root = monkeysMap['root']!;

    var yellingNumber = root.getNumber(monkeysMap).toInt();

    return yellingNumber.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final monkeys = puzzleInput.splitPerLine().map((e) => Monkey(e)).toList();
    final monkeysMap = Map<String, Monkey>.fromIterable(monkeys,
        key: ((dynamic element) => (element as Monkey).name));

    var root = monkeysMap['root']!;
    var me = monkeysMap['humn']!;
    me.number = 1;

    var rootSecondMonkeyValue = monkeysMap[root.secondMonkeyName]!.getNumber(monkeysMap);
    var rootFirstMonkeyValue = monkeysMap[root.firstMonkeyName]!.getNumber(monkeysMap);

    while (rootFirstMonkeyValue != rootSecondMonkeyValue) {
      final difference = rootFirstMonkeyValue - rootSecondMonkeyValue;
      me.number += (difference ~/ 100).abs();
      me.number++;

      rootFirstMonkeyValue = monkeysMap[root.firstMonkeyName]!.getNumber(monkeysMap);
    }

    return me.number.toInt().toString();
  }
}

class Monkey {
  late String name;
  num number = 0;
  late String firstMonkeyName;
  late String secondMonkeyName;

  late num Function(num first, num second) calculation;

  Monkey(String rawMonkey) {
    final parts = rawMonkey.split(': ');
    name = parts[0];

    if (parts[1].contains('+')) {
      _initializeMonkeyNames(parts[1], ' + ');
      calculation = (num first, num second) => first + second;
    } else if (parts[1].contains('-')) {
      _initializeMonkeyNames(parts[1], ' - ');
      calculation = (num first, num second) => first - second;
    } else if (parts[1].contains('*')) {
      _initializeMonkeyNames(parts[1], ' * ');
      calculation = (num first, num second) => first * second;
    } else if (parts[1].contains('/')) {
      _initializeMonkeyNames(parts[1], ' / ');
      calculation = (num first, num second) => first / second;
    } else {
      number = num.parse(parts[1]);
    }
  }

  num getNumber(Map<String, Monkey> monkeysMap) {
    if (number != 0) {
      return number;
    }
    return calculation(monkeysMap[firstMonkeyName]!.getNumber(monkeysMap),
        monkeysMap[secondMonkeyName]!.getNumber(monkeysMap));
  }

  void _initializeMonkeyNames(String calculationPart, String calculation) {
    final monkeyNames = calculationPart.split(calculation);
    firstMonkeyName = monkeyNames[0];
    secondMonkeyName = monkeyNames[1];
  }
}
