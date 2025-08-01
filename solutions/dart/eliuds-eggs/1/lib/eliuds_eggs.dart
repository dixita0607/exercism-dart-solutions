// A very simple decimal to binary convertor.
// TODO: Learn other algorithms and submit new versions.

String decimalToBinary(int number) {
  int remainder = number % 2;
  int quotient = number ~/ 2;
  String binary = '';
  while (quotient != 0) {
    binary = '$remainder$binary';
    remainder = quotient % 2;
    quotient = quotient ~/ 2;
  }
  binary = '$remainder$binary';
  return binary;
}

class EggCounter {
  int count(int decimal) {
    return decimalToBinary(decimal).replaceAll('0', '').length;
  }
}
