class ProteinTranslation {
  List<String> translate(String sequences) {
    final List<String> translations = [];
    for (int i = 0; i < sequences.length; i += 3) {
      final aminoAcid =
          Protein.fromSequence(sequences.substring(i, i + 3)).aminoAcid;
      if (aminoAcid == 'STOP')
        break;
      else
        translations.add(aminoAcid);
    }
    return translations;
  }
}

enum Protein {
  AUG('Methionine'),
  UUU('Phenylalanine'),
  UUC('Phenylalanine'),
  UUA('Leucine'),
  UUG('Leucine'),
  UCU('Serine'),
  UCC('Serine'),
  UCA('Serine'),
  UCG('Serine'),
  UAU('Tyrosine'),
  UAC('Tyrosine'),
  UGU('Cysteine'),
  UGC('Cysteine'),
  UGG('Tryptophan'),
  UAA('STOP'),
  UAG('STOP'),
  UGA('STOP');

  final String aminoAcid;

  const Protein(this.aminoAcid);

  factory Protein.fromSequence(String codon) {
    try {
      return Protein.values.firstWhere((value) => value.name == codon);
    } on StateError {
      throw ArgumentError('Invalid codon');
    }
  }
}

