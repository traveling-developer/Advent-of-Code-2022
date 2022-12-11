import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day10 implements Day {
  @override
  int get dayNumber => 10;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final instructions = puzzleInput.splitPerLine().map((e) => Instruction(e)).toList();
    final cpu = CPU();

    for (var instruction in instructions) {
      cpu.processInstruction(instruction);
    }

    var result = cpu.signalStrengths.sum;
    return result.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final instructions = puzzleInput.splitPerLine().map((e) => Instruction(e)).toList();
    final cpu = CPU();

    for (var instruction in instructions) {
      cpu.processInstruction(instruction);
    }

    var pixels = cpu.flatPixels.slices(40);
    String result = '';
    for (var row in pixels) {
      result += '${row.join()}\n';
    }

    return result.toString();
  }
}

enum InstructionType { add, noop }

class Instruction {
  late InstructionType type;
  late int value;

  Instruction(String rawInstruction) {
    final parts = rawInstruction.split(' ');

    if (parts[0] == 'noop') {
      type = InstructionType.noop;
    } else {
      type = InstructionType.add;
      value = int.parse(parts[1]);
    }
  }
}

class CPU {
  int cycles = 0;
  int register = 1;
  List<int> signalStrengths = [];
  final flatPixels = List.filled(240, '.');

  void processInstruction(Instruction instruction) {
    if (instruction.type == InstructionType.noop) {
      tick();
      return;
    }
    if (instruction.type == InstructionType.add) {
      tick();
      tick();
      register += instruction.value;
      return;
    }
  }

  void tick() {
    cycles++;
    checkSignalStrength();
    drawPixel();
  }

  void checkSignalStrength() {
    if ((cycles - 20) % 40 == 0) {
      signalStrengths.add(cycles * register);
    }
  }

  void drawPixel() {
    final column = (cycles - 1) % 40;
    if (column >= register - 1 && column <= register + 1) {
      flatPixels[cycles - 1] = '#';
    }
  }
}
