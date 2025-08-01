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

  factory Protein.fromCodon(String codon) {
    try {
      return Protein.values.firstWhere((value) => value.name == codon);
    } on StateError {
      throw ArgumentError('Invalid codon');
    }
  }
}

class ProteinTranslation {
  List<String> translate(String codons) {
    final List<String> aminoAcids = [];
    for (int i = 0; i < codons.length; i += 3) {
      final codon = codons.substring(i, i + 3);
      if (codon == Protein.UAA.name ||
          codon == Protein.UAG.name ||
          codon == Protein.UGA.name) break;
      aminoAcids.add(Protein.fromCodon(codon).aminoAcid);
    }
    return aminoAcids;
  }
}
