// Starting with vowels or 'xr' or 'yt'
final ruleOne = RegExp(r'^(xr|yt|[aeiou])', caseSensitive: false);
// Starting with one or more consonents
final ruleTwo = RegExp(r'^[^aeiou]{1,}', caseSensitive: false);
// Starting with zero or more consonents followed by a 'qu'
final ruleThree = RegExp(r'^[^aeiou]{0,}qu', caseSensitive: false);
// Starting with zero or more consonents followed by a 'y'
final ruleFour = RegExp(r'^[^aeiou]{1,}y', caseSensitive: false);

String translate(String phrase) {
  return phrase.split(' ').map((word) {
    if (word.isEmpty) return word;
    if (ruleOne.hasMatch(word)) return '${word}ay';
    if (ruleThree.hasMatch(word))
      return '${word.split('qu').reversed.join('')}quay';
    if (ruleFour.hasMatch(word))
      return 'y${word.split('y').reversed.join('')}ay';
    if (ruleTwo.hasMatch(word))
      return '${word.split(ruleTwo).join('')}${ruleTwo.stringMatch(word)}ay';
    else
      throw ArgumentError('The input does not follow any of the rules');
  }).join(' ');
}