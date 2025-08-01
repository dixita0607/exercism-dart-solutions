class Queen {
  int row;
  int col;

  Queen(this.row, this.col) {
    if (this.row < 0) throw AssertionError('row not positive');
    if (this.row > 7) throw AssertionError('row not on board');
    if (this.col < 0) throw AssertionError('column not positive');
    if (this.col > 7) throw AssertionError('column not on board');
  }

  bool canAttack(Queen queen) => queen.row == this.row && queen.col == this.col
      ? false
      : ((queen.row - this.row).abs() == (queen.col - this.col).abs());
}
