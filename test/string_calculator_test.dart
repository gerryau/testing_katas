import 'package:test/test.dart';
import 'package:testing_katas/string_calculator/string_calculator.dart';

void main() {
  test(
    'empty string passed into add() returns 0',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add(''), 0);
    },
  );

  test(
    'Single number entered into add() returns number',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add('4'), 4);
    },
  );

  // 2.
  test('Two numbers are entered into add() returns the sum of entered numbers',
      () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add('1,2'), 3);
  });
  test(
      'Multiple numbers are entered into add() returns the sum of entered numbers',
      () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add('1,2,3'), 6);
  });

  // 3.
  test(
      'Multiple numbers are entered into add() with new line return the sum of entered numbers',
      () {
    final stringCalculator = StringCalculator();
    expect(stringCalculator.add('1\n2,3'), 6);
  });

  // 4.
  test(
    'Multiple delimiters passed in with numbers to add() return only the sum of numbers',
    () {
      final stringCalculator = StringCalculator();
      expect(stringCalculator.add("//;\n1;2"), 3);
    },
  );

  // 5.
  test(
    'Call add() function with a negative number and return exception',
    () {
      final stringCalculator = StringCalculator();
      expect(
        () => stringCalculator.add("1,-2"),
        throwsA(
          predicate((e) =>
              e is NegativeNumberException &&
              e.message == 'negatives not allowed: -2'),
        ),
      );
    },
  );
}
