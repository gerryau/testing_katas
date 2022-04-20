class StringCalculator {
  int add(String numbers) {
    if (numbers.isEmpty) {
      return 0;
    } else {
      return sumOfNumbers(numbers);
    }
  }

  int sumOfNumbers(String numbers) {
    int sum = 0;
    // if (numbers.length == 1) {
    //   return int.parse(numbers);
    // } else {
    List<int> numArray = removeInvalidCharacters(numbers);
    for (final i in numArray) {
      sum += i;
    }
    // sum = numArray[0] + numArray[1]
    return sum;
    // }
  }

  List<int> removeInvalidCharacters(String numbers) {
    //'//;\n1;2'
    //'1,2'
    //... x > '0' || x < '9
    final numbers2 = numbers.split('');
    List<int> numArray = [];
    for (int i = 0; i < numbers2.length; i++) {
      if (numbers2[i] == "-" && int.tryParse(numbers2[i + 1]) != null) {
        throw (NegativeNumberException(
            'negatives not allowed: -${numbers2[i + 1]}'));
      }
      if (int.tryParse(numbers2[i]) != null) {
        numArray.add(int.parse(numbers2[i]));
      }
    }
    return numArray;
    // final newNums = numbers.replaceAll("\n", ',');
    // return newNums.split(',');
  }
}

class NegativeNumberException implements Exception {
  late String message;

  NegativeNumberException(this.message);
}
