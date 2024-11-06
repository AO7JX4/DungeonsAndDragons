class Attributes {
  // Base stats
  final int vitality; // Health
  final int endurance; // Inventory size
  final int experience; // Exp

  // Base scaling stats
  final int strength;
  final int intelligence;
  final int agility;

  // Special scaling stats
  final int inferno;
  final int faith;
  final int spirit;
  final int dark;

  Attributes({
    required this.vitality,
    required this.endurance,
    required this.experience,
    required this.strength,
    required this.intelligence,
    required this.agility,
    required this.inferno,
    required this.faith,
    required this.spirit,
    required this.dark,
  });


  Attributes copyWith({
    int? vitality,
    int? endurance,
    int? experience,
    int? strength,
    int? intelligence,
    int? agility,
    int? inferno,
    int? faith,
    int? spirit,
    int? dark,
  }) {
    return Attributes(
      vitality: vitality ?? this.vitality,
      endurance: endurance ?? this.endurance,
      experience: experience ?? this.experience,
      strength: strength ?? this.strength,
      intelligence: intelligence ?? this.intelligence,
      agility: agility ?? this.agility,
      inferno: inferno ?? this.inferno,
      faith: faith ?? this.faith,
      spirit: spirit ?? this.spirit,
      dark: dark ?? this.dark,
    );
  }
}
