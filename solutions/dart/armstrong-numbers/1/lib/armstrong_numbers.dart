class ArmstrongNumbers {
  bool isArmstrongNumber(String number) {
    return number
            .split('')
            .fold<BigInt>(
              BigInt.from(0),
              (sum, digit) => sum + BigInt.parse(digit).pow(number.length),
            ) ==
        BigInt.parse(number);
  }
}
