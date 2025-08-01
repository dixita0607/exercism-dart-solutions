class InvalidNucleotideException implements Exception {
  noSuchMethod(Invocation invocation) {
    print("The DNA sequence contain invalid nucleotide(s): $invocation");
  }
}

typedef NucleotideCountType = Map<String, int>;

class NucleotideCount {
  NucleotideCountType count(String sequence) {
    // If the sequence contain anything but ACGT, throw exception.
    if (sequence.contains(RegExp(r'[^ACGT]'))) {
      throw InvalidNucleotideException();
    }
    return sequence.split('').fold<NucleotideCountType>(
      {"A": 0, "C": 0, "G": 0, "T": 0},
      (counts, nucleotide) {
        counts[nucleotide] = counts[nucleotide]! + 1;
        return counts;
      },
    );
  }
}
