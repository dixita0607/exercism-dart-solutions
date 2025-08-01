import 'package:collection/collection.dart';

final int cca = 'a'.codeUnitAt(0);
final int ccz = 'z'.codeUnitAt(0);

class AtbashCipher {
  
  List<String> _transform(String text) {
    return text
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9]'), '')
        .split('')
        .map((c) {
          int cc = c.codeUnitAt(0);
          return cc >= cca && cc <= ccz 
            ? String.fromCharCode(cca + (ccz - cc)) 
            :c;
        })
        .toList();
  }
  
  String encode(String plainText) {
    return _transform(plainText)
        .slices(5)
        .map((characters) => characters.join(''))
        .join(' ');
  }
  
  String decode(String encodedText) {
    return _transform(encodedText)
        .join('');
  }
  
}