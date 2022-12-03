import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day3 implements Day {
  @override
  int get dayNumber => 3;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final backpacks = puzzleInput.splitPerLine().map((e) => Backpack(e));

    var wrongItems = backpacks.map((e) => e.getItemWhichIsInBothCompartments());

    var priorities = wrongItems.map((e) => priorityLookup[e]!).toList();

    return priorities.sum.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    var groups = puzzleInput.splitPerLine().slices(3).map((e) => Group(e));

    var badges = groups.map((e) => e.getBadge());

    var priorities = badges.map((e) => priorityLookup[e]!).toList();

    return priorities.sum.toString();
  }
}

Map<String, int> priorityLookup = generatePriorityLookup();

class Backpack {
  late Set<String> firstCompartment;
  late Set<String> secondCompartment;

  Backpack(String rawBackpackContent) {
    firstCompartment =
        rawBackpackContent.substring(0, rawBackpackContent.length ~/ 2).split('').toSet();
    secondCompartment = rawBackpackContent
        .substring(rawBackpackContent.length ~/ 2, rawBackpackContent.length)
        .split('')
        .toSet();
  }

  String getItemWhichIsInBothCompartments() {
    var compartmentIntersection = firstCompartment.intersection(secondCompartment);

    return compartmentIntersection.single;
  }
}

class Group {
  late Set<String> firstElvesItems;
  late Set<String> secondElvesItems;
  late Set<String> thirdElvesItems;
  Group(List<String> rawGroup) {
    firstElvesItems = rawGroup[0].split('').toSet();
    secondElvesItems = rawGroup[1].split('').toSet();
    thirdElvesItems = rawGroup[2].split('').toSet();
  }

  String getBadge() {
    var groupIntersection =
        firstElvesItems.intersection(secondElvesItems).intersection(thirdElvesItems);
    return groupIntersection.single;
  }
}

Map<String, int> generatePriorityLookup() {
  Map<String, int> priorityLookup = {};

  int counter = 27;
  for (var i = 65; i <= 90; i++) {
    priorityLookup.putIfAbsent(String.fromCharCode(i), () => counter);
    counter++;
  }

  counter = 1;
  for (var i = 97; i <= 122; i++) {
    priorityLookup.putIfAbsent(String.fromCharCode(i), () => counter);
    counter++;
  }

  return priorityLookup;
}
