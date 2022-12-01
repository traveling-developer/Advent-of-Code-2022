import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:test/test.dart';

void main() {
  group('day 1', () {
    test('splitPerLine - single line - returns array with one value', () {
      final string = 'someValue';

      final splitString = string.splitPerLine();

      expect(splitString.length, equals(1));
      expect(splitString, contains(string));
    });

    test('splitPerLine - multiple lines - returns array with expected number of lines', () {
      final string = '''
FirstLine
SecondLine
ThirdLine
''';

      final splitString = string.splitPerLine();

      expect(splitString.length, equals(3));
    });

    test('splitByEmptyLine - none empty line - returns array with one value', () {
      final string = '''
FirstLine
SecondLine
ThirdLine
''';

      final splitString = string.splitByEmptyLine();

      expect(splitString.length, equals(1));
    });

    test('splitByEmptyLine - some empty lines - returns array with expected number of values', () {
      final string = '''
FirstLine
SecondLine

ThirdLine
FourthLine

FifthLine
''';

      final splitString = string.splitByEmptyLine();

      expect(splitString.length, equals(3));
    });
  });
}
