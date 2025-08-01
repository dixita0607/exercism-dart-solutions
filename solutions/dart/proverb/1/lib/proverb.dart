class Proverb {
  String recite(List<String> pieces) {
    int numberOfPieces = pieces.length;
    
    if (numberOfPieces == 0) return '';
    
    String poem = 'And all for the want of a ${pieces.first}.';
    while(numberOfPieces != 1) {
      poem = 'For want of a ${pieces[numberOfPieces - 2]} the ${pieces[numberOfPieces - 1]} was lost.\n$poem';
      numberOfPieces = numberOfPieces - 1; 
    }
    return poem.trim();
  }
}
