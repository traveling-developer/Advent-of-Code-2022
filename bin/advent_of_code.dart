import 'dart:async';

import 'package:adventofcode2022/advent_of_code_api.dart';
import 'package:adventofcode2022/day01.dart';
import 'package:adventofcode2022/day02.dart';
import 'package:adventofcode2022/day03.dart';
import 'package:adventofcode2022/day04.dart';
import 'package:adventofcode2022/day05.dart';
import 'package:adventofcode2022/day06.dart';
import 'package:adventofcode2022/day07.dart';
import 'package:adventofcode2022/day08.dart';
import 'package:adventofcode2022/day09.dart';
import 'package:adventofcode2022/day10.dart';

Future<void> main(List<String> arguments) async {
  final adventOfCode = AdventOfCode(arguments[0]);
  await solveDay(Day10(), adventOfCode);
  await solveDay(Day9(), adventOfCode);
  await solveDay(Day8(), adventOfCode);
  await solveDay(Day7(), adventOfCode);
  await solveDay(Day6(), adventOfCode);
  await solveDay(Day5(), adventOfCode);
  await solveDay(Day4(), adventOfCode);
  await solveDay(Day3(), adventOfCode);
  await solveDay(Day2(), adventOfCode);
  await solveDay(Day1(), adventOfCode);
}
