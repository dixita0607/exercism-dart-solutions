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
      : this.strength = ability(),
        this.dexterity = ability(),
        this.constitution = ability(),
        this.intelligence = ability(),
        this.wisdom = ability(),
        this.charisma = ability();

  static int ability() => (List.generate(4, (_) => _nextDice())..sort())
      .sublist(1)
      .fold<int>(0, (sum, dice) => sum + dice);

  static int modifier(int constitution) => ((constitution - 10) / 2).floor();

  static final _random = Random();
  static int _nextDice() => 1 + _random.nextInt(6);
}
