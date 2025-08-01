class PhoneNumber {
  dynamic clean(String phoneNumber) {
    if (phoneNumber.contains(RegExp(r'[a-z]', caseSensitive: false))) {
      throw FormatException('letters not permitted');
    }

    if (phoneNumber.contains(RegExp(r'[^\w\d\-\(\)\.\+\s]'))) {
      throw FormatException('punctuations not permitted');
    }

    String cleanNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (cleanNumber.length < 10) {
      throw FormatException('must not be fewer than 10 digits');
    }
    if (cleanNumber.length > 11) {
      throw FormatException('must not be greater than 11 digits');
    }
    
    if (cleanNumber.length == 11) {
      if (!cleanNumber.startsWith('1')) {
        throw FormatException('11 digits must start with 1');
      }
      cleanNumber = cleanNumber.substring(1);
    }
    
    if (cleanNumber[0] == '0') {
      throw FormatException('area code cannot start with zero');
    }
    if (cleanNumber[0] == '1') {
      throw FormatException('area code cannot start with one');
    }
    if (cleanNumber[3] == '0') {
      throw FormatException('exchange code cannot start with zero');
    }
    if (cleanNumber[3] == '1') {
      throw FormatException('exchange code cannot start with one');
    }
    
    return cleanNumber;
  }
}
