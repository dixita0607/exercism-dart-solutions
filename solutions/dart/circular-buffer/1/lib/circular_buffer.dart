class EmptyBufferException implements Exception {}

class FullBufferException implements Exception {}

class CircularBuffer {
  final int size;
  static int readPosition = 0;
  static int writePosition = readPosition;
  late List<dynamic> buffer = List.generate(size, (_) => null, growable: false);

  CircularBuffer(this.size);

  dynamic read() {
    if (buffer.every((element) => element == null))
      throw EmptyBufferException();
    else {
      dynamic character = buffer[readPosition];
      buffer[readPosition] = null;
      readPosition = (readPosition + 1) % size;
      return character;
    }
  }

  void write(dynamic character, {bool force = false}) {
    if (buffer[writePosition] == null) {
      buffer[writePosition] = character;
      writePosition = (writePosition + 1) % size;
    } else if (force) {
      buffer[readPosition] = character;
      readPosition = (readPosition + 1) % size;
      writePosition = readPosition;
    } else {
      throw FullBufferException();
    }
  }

  void clear() {
    buffer.fillRange(0, size, null);
  }
}
