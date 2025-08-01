class RnaTranscription {
  static const Map<String, String> _dnaToRna = const {
    'G': 'C',
    'C': 'G',
    'T': 'A',
    'A': 'U',
  };

  String toRna(String dna) =>
      List.generate(dna.length, (index) => _dnaToRna[dna[index]]).join('');
}
