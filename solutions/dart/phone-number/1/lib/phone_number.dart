class PhoneNumber {
  dynamic clean(String phoneNumber) {
    if (phoneNumber.contains(RegExp(r'[a-z]', caseSensitive: false))) {
      throw FormatException('letters not permitted');
    }

    if (phoneNumber.contains(RegExp(r'[^\w\d\-\(\)\.\+\s]'))) {
      throw FormatException('punctuations not permitted');
    }

    String trimmedNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (trimmedNumber.length < 10) {
      throw FormatException('must not be fewer than 10 digits');
    }
    if (trimmedNumber.length > 11) {
      throw FormatException('must not be greater than 11 digits');
    }
    if (trimmedNumber.length == 10) {
      if (trimmedNumber[0] == '0') {
        throw FormatException('area code cannot start with zero');
      }
      if (trimmedNumber[0] == '1') {
        throw FormatException('area code cannot start with one');
      }
      if (trimmedNumber[3] == '0') {
        throw FormatException('exchange code cannot start with zero');
      }
      if (trimmedNumber[3] == '1') {
        throw FormatException('exchange code cannot start with one');
      }
    }
    if (trimmedNumber.length == 11) {
      if (trimmedNumber[0] != '1') {
        throw FormatException('11 digits must start with 1');
      }
      if (trimmedNumber[1] == '0') {
        throw FormatException('area code cannot start with zero');
      }
      if (trimmedNumber[1] == '1') {
        throw FormatException('area code cannot start with one');
      }
      if (trimmedNumber[4] == '0') {
        throw FormatException('exchange code cannot start with zero');
      }
      if (trimmedNumber[4] == '1') {
        throw FormatException('exchange code cannot start with one');
      }
    }
    if (trimmedNumber
        .replaceAll(RegExp(r'^1{0,1}([2-9]{1}[0-9]{2}){2}[0-9]{4}'), '')
        .isEmpty) {
      return trimmedNumber.length == 10
          ? trimmedNumber
          : trimmedNumber.substring(1);
    }
    return null;
  }
}