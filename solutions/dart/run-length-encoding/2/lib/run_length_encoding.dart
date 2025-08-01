class RunLengthEncoder {
  String encode(String input) {
    if (input.isEmpty) return '';

    final StringBuffer output = StringBuffer();
    int count = 1;
    String prev = input[0];
    int i = 1;

    while (i < input.length) {
      if (input[i] == prev) {
        count += 1;
      } else {
        output.writeAll([if (count > 1) count, prev]);
        count = 1;
      }
      prev = input[i];
      i += 1;
    }
    // To write the last character and its count
    output.writeAll([if (count > 1) count, prev]);
    return output.toString();
  }

  String decode(String input) {
    if (input.isEmpty) return '';

    StringBuffer output = StringBuffer();
    int charLength = 0;
    int i = 0;

    while (i < input.length) {
      int? count = int.tryParse(input[i]);
      if (count == null) {
        if (charLength > 0) {
          for (int j = 0; j < charLength; j++) output.write(input[i]);
          charLength = 0;
        } else {
          output.write(input[i]);
        }
      } else {
        charLength = (charLength == 0 ? count : (charLength * 10) + count);
      }
      i++;
    }

    return output.toString();
  }
}
