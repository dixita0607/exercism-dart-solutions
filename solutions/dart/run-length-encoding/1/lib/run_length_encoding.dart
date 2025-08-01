class RunLengthEncoder {
  String encode(String input) {
    if (input.isEmpty) return '';

    final StringBuffer output = StringBuffer();
    int count = 1;
    int i = 1;

    while (i < input.length) {
      if (input[i] != input[i - 1]) {
        output.writeAll([if (count > 1) count, input[i - 1]]);
        count = 1;
      } else
        count += 1;
      i += 1;
    }
    // To write the last character and its count
    output.writeAll([if (count > 1) count, input[i - 1]]);
    return output.toString();
  }

  String decode(String input) {
    if (input.isEmpty) return '';
    int count = -1;
    StringBuffer tempBuffer = StringBuffer();

    return input.splitMapJoin(RegExp(r'\d+'), onNonMatch: (word) {
      if (word.isEmpty) return '';
      for (int i = 1; i < count; i++) tempBuffer.write(word[0]);
      tempBuffer.write(word);
      return tempBuffer.toString();
    }, onMatch: (match) {
      count = int.parse(match[0]!);
      if (tempBuffer.isNotEmpty) tempBuffer.clear();
      return '';
    });
  }
}
