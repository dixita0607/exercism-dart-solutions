import 'dart:math';

class DndCharacter {
  final int strength;
  final int dexterity;
  final int constitution;
  final int intelligence;
  final int wisdom;
  final int charisma;

  late final int hitpoints = 10 + modifier(constitution);

  DndCharacter.create()
      : this.strength = _nextScore(),
        this.dexterity = _nextScore(),
        this.constitution = _nextScore(),
        this.intelligence = _nextScore(),
        this.wisdom = _nextScore(),
        this.charisma = _nextScore();

  static int ability() => _nextScore();

  static int modifier(int constitution) => ((constitution - 10) / 2).floor();

  static final _random = Random();
  static _nextScore() => 3 + _random.nextInt(16);
}