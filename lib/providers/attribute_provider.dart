import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/attributes.dart';

part 'attribute_provider.g.dart';

@riverpod
class CharacterAttributeState extends _$CharacterAttributeState {
  @override
  Attributes build() {
    return Attributes(
      vitality: 0,
      endurance: 0,
      experience: 0,
      strength: 0,
      intelligence: 0,
      agility: 0,
      inferno: 0,
      faith: 0,
      spirit: 0,
      dark: 0,
    );
  }


  int unspentPoints = 10;


  bool get hasUnspentPoints => unspentPoints > 0;


  void updateVitality(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(vitality: state.vitality + value);
      unspentPoints--;
    }
  }

  void updateEndurance(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(endurance: state.endurance + value);
      unspentPoints--;
    }
  }

  void updateExperience(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(experience: state.experience + value);
      unspentPoints--;
    }
  }

  void updateStrength(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(strength: state.strength + value);
      unspentPoints--;
    }
  }

  void updateIntelligence(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(intelligence: state.intelligence + value);
      unspentPoints--;
    }
  }

  void updateAgility(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(agility: state.agility + value);
      unspentPoints--;
    }
  }

  void updateInferno(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(inferno: state.inferno + value);
      unspentPoints--;
    }
  }

  void updateFaith(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(faith: state.faith + value);
      unspentPoints--;
    }
  }

  void updateSpirit(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(spirit: state.spirit + value);
      unspentPoints--;
    }
  }

  void updateDark(int value) {
    if (hasUnspentPoints) {
      state = state.copyWith(dark: state.dark + value);
      unspentPoints--;
    }
  }
}
