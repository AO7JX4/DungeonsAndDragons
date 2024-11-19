import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../data/appearance.dart';
import 'asset_provider.dart';

part 'appearance_provider.g.dart';

@riverpod
class CharacterAppearanceState extends _$CharacterAppearanceState {
  @override
  Appearance build() {
    final hairAssets = ref.watch(hairAssetsProvider);
    final eyeAssets = ref.watch(eyeAssetsProvider);
    final mouthAssets = ref.watch(mouthAssetsProvider);
    final headAssets = ref.watch(headAssetsProvider);

    return Appearance(
      hairIndex: 0,
      eyeIndex: 0,
      mouthIndex: 0,
      headIndex: 0,
      hairColorR: 255.0,
      hairColorG: 255.0,
      hairColorB: 255.0,
      eyeColorR: 255,
      eyeColorG: 255,
      eyeColorB: 255,
      hairAssets: hairAssets,
      eyeAssets: eyeAssets,
      mouthAssets: mouthAssets,
      headAssets: headAssets,
    );
  }



  void changeHairIndex() {
    state = state.copyWith(
      hairIndex: (state.hairIndex + 1) % state.hairAssets.length,
    );
  }

  void changeEyeIndex() {
    state = state.copyWith(
      eyeIndex: (state.eyeIndex + 1) % state.eyeAssets.length,
    );
  }

  void changeMouthIndex() {
    state = state.copyWith(
      mouthIndex: (state.mouthIndex + 1) % state.mouthAssets.length,
    );
  }

  void changeHeadIndex() {
    state = state.copyWith(
      headIndex: (state.headIndex + 1) % state.headAssets.length,
    );
  }

  void updateHairRColor(double r) {
    state = state.copyWith(
      hairColorR: r,
    );
  }

  void updateHairGColor(double g) {
    state = state.copyWith(
      hairColorG: g,
    );
  }

  void updateHairBColor(double b) {
    state = state.copyWith(
      hairColorB: b,
    );
  }

  void updateEyeRColor(double r) {
    state = state.copyWith(
      eyeColorR: r,
    );
  }

  void updateEyeGColor(double g) {
    state = state.copyWith(
      eyeColorG: g,
    );
  }

  void updateEyeBColor(double b) {
    state = state.copyWith(
      eyeColorB: b,
    );
  }
}
