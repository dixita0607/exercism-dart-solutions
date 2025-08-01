import "package:collection/collection.dart";

// TODO: Submit second version of this exercise using streams.
class AtbashCipher {
  static final List<String> _alphabets = 'abcdefghijklmnopqrstuvwxyz'.split('');
  static final List<String> _reversedAlphabets = _alphabets.reversed.toList();

  String _transform({
    required String text,
    required List<String> fromSequence,
    required List<String> toSequence,
  }) { 
    List<String> toBeTransformed = text.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '').trim().split('');
    
    return toBeTransformed.foldIndexed<String>('', (index, prevLetter, letter) {
      String cipheredLetter =
          fromSequence.contains(letter) ? toSequence[fromSequence.indexOf(letter)] : letter;
      return "$prevLetter${index % 5 == 0 && index != 0 ? ' $cipheredLetter' : '$cipheredLetter'}";
    });
  }

  String encode(String text) {
    return _transform(text: text, fromSequence: _alphabets, toSequence: _reversedAlphabets);
  }

  String decode(String text) {
    return _transform(
      text: text,
      fromSequence: _reversedAlphabets,
      toSequence: _alphabets,
    ).replaceAll(' ', '');
  }
}

