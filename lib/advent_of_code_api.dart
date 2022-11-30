import 'package:adventofcode2022/day.dart';
import 'package:http/http.dart' as http;

class AdventOfCode {
  final String _sessionCookie;
  final String _year = '2022';

  AdventOfCode(this._sessionCookie);

  Future<String> getPuzzleInputOfDay(int day) async {
    var response = await http.get(
      Uri.parse('https://adventofcode.com/$_year/day/$day/input'),
      headers: {'Cookie': _sessionCookie},
    );

    return response.body;
  }
}

Future<void> solveDay(Day day, AdventOfCode adventOfCode) async {
  final puzzleInput = await adventOfCode.getPuzzleInputOfDay(day.dayNumber);

  print('Day ${day.dayNumber} Solutions:');
  print('First puzzle Solution: ${day.solveFirstPuzzle(puzzleInput)}');
  print('Second puzzle Solution: ${day.solveSecondPuzzle(puzzleInput)}');
}
