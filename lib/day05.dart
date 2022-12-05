import 'dart:collection';

import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';

class Day5 implements Day {
  @override
  int get dayNumber => 5;
  final emptyCrate = '[x]';

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final stacksAndProcedures = puzzleInput.splitByEmptyLine().toList();
    final rawStacks = addEmptyCratesToRawStacks(stacksAndProcedures[0]).toList();

    final stacks = createStacksFromRawInput(rawStacks).toList();
    final procedures = stacksAndProcedures[1].splitPerLine().map((e) => Procedure(e)).toList();

    for (var procedure in procedures) {
      final origin = stacks.singleWhere((element) => element.number == procedure.originStack);
      final destination = stacks.singleWhere((element) => element.number == procedure.targetStack);

      for (var i = 0; i < procedure.amountOfCrates; i++) {
        destination.crates.addLast(origin.crates.last);
        origin.crates.removeLast();
      }
    }

    final result = stacks.map((e) => e.crates.last.mark).join();

    return result;
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final stacksAndProcedures = puzzleInput.splitByEmptyLine().toList();
    final rawStacks = addEmptyCratesToRawStacks(stacksAndProcedures[0]).toList();

    final stacks = createStacksFromRawInput(rawStacks).toList();
    final procedures = stacksAndProcedures[1].splitPerLine().map((e) => Procedure(e)).toList();

    for (var procedure in procedures) {
      final origin = stacks.singleWhere((element) => element.number == procedure.originStack);
      final destination = stacks.singleWhere((element) => element.number == procedure.targetStack);
      final bufferStack = ListQueue<Crate>();

      for (var i = 0; i < procedure.amountOfCrates; i++) {
        bufferStack.add(origin.crates.last);
        origin.crates.removeLast();
      }

      while (bufferStack.isNotEmpty) {
        destination.crates.addLast(bufferStack.last);
        bufferStack.removeLast();
      }
    }

    final result = stacks.map((e) => e.crates.last.mark).join();

    return result;
  }

  List<Stack> createStacksFromRawInput(List<String> rawStacks) {
    var stackNumbers = rawStacks.first.replaceAll(' ', '').split('');
    rawStacks.remove(rawStacks.first);

    var stacks = stackNumbers.map((e) => Stack(e)).toList();

    for (var element in rawStacks) {
      var crates = element.split(' ');

      for (var i = 0; i < crates.length; i++) {
        var crate = crates[i];

        if (crate == emptyCrate) {
          continue;
        }

        stacks.singleWhere((element) => element.number == i + 1).crates.addLast(Crate(crate));
      }
    }

    return stacks;
  }

  Iterable<String> addEmptyCratesToRawStacks(String rawStacks) {
    return rawStacks
        .splitPerLine()
        .map((e) {
          e = e.replaceAll(']    ', '] $emptyCrate');
          e = e.replaceAll('    ', '$emptyCrate ');
          return e;
        })
        .toList()
        .reversed;
  }
}

class Stack {
  num number = 0;
  ListQueue<Crate> crates = ListQueue();

  Stack(String rawStack) {
    number = num.parse(rawStack);
  }
}

class Crate {
  String mark = '';

  Crate(String rawCrate) {
    mark = rawCrate.replaceAll('[', '').replaceAll(']', '');
  }
}

class Procedure {
  num originStack = 0;
  num targetStack = 0;
  num amountOfCrates = 0;

  Procedure(String rawProcedure) {
    final splitRawProcedure = rawProcedure.split(' ');
    originStack = num.parse(splitRawProcedure[3]);
    targetStack = num.parse(splitRawProcedure[5]);
    amountOfCrates = num.parse(splitRawProcedure[1]);
  }
}
