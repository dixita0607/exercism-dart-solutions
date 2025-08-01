class Queen {
  int row;
  int col;

  Queen(int row, int col)
      : assert(row >= 0, 'row not positive'),
        assert(row <= 7, 'row not on board'),
        assert(col >= 0, 'column not positive'),
        assert(col <= 7, 'column not on board'),
        this.row = row,
        this.col = col;

  bool canAttack(Queen queen) {
    if (queen.row == this.row && queen.col == this.col) return false;
    if (queen.row == this.row || queen.col == this.col) return true;
    return (queen.row - this.row).abs() == (queen.col - this.col).abs();
  }
}
