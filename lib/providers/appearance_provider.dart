import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../generated/assets.dart';

part 'appearance_provider.g.dart';

@riverpod
class CharacterAppearanceState extends _$CharacterAppearanceState {
  final List<String> hairAssets = [
    Assets.appearanceHair1,
    Assets.appearanceHair2,
    Assets.appearanceHair3,
  ];

  final List<String> eyeAssets = [
    Assets.appearanceEye1,
    Assets.appearanceEye2,
    Assets.appearanceEye3,
  ];

  final List<String> mouthAssets = [
    Assets.appearanceMouth1,
    Assets.appearanceMouth2,
    Assets.appearanceMouth3,
  ];

  final List<String> headAssets = [
    Assets.appearanceHead1,
    Assets.appearanceHead2,
    Assets.appearanceHead3,
  ];

  @override
  CharacterAppearance build() => CharacterAppearance(
    hairIndex: 0,
    eyeIndex: 0,
    mouthIndex: 0,
    headIndex: 0,
    hairColorR: 255.0,
    hairColorG: 255.0,
    hairColorB: 255.0,
    hairAssets: hairAssets,
    eyeAssets: eyeAssets,
    mouthAssets: mouthAssets,
    headAssets: headAssets,
  );

  void changeHairIndex() {
    state = state.copyWith(
      hairIndex: (state.hairIndex + 1) % hairAssets.length,
    );
  }

  void changeEyeIndex() {
    state = state.copyWith(
      eyeIndex: (state.eyeIndex + 1) % eyeAssets.length,
    );
  }

  void changeMouthIndex() {
    state = state.copyWith(
      mouthIndex: (state.mouthIndex + 1) % mouthAssets.length,
    );
  }

  void changeHeadIndex() {
    state = state.copyWith(
      headIndex: (state.headIndex + 1) % headAssets.length,
    );
  }

  // Update hair color
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
}

class CharacterAppearance {
  final int hairIndex;
  final int eyeIndex;
  final int mouthIndex;
  final int headIndex;
  final double hairColorR;
  final double hairColorG;
  final double hairColorB;
  final List<String> hairAssets;
  final List<String> eyeAssets;
  final List<String> mouthAssets;
  final List<String> headAssets;

  CharacterAppearance({
    required this.hairIndex,
    required this.eyeIndex,
    required this.mouthIndex,
    required this.headIndex,
    required this.hairColorR,
    required this.hairColorG,
    required this.hairColorB,
    required this.hairAssets,
    required this.eyeAssets,
    required this.mouthAssets,
    required this.headAssets,
  });

  CharacterAppearance copyWith({
    int? hairIndex,
    int? eyeIndex,
    int? mouthIndex,
    int? headIndex,
    double? hairColorR,
    double? hairColorG,
    double? hairColorB,
  }) {
    return CharacterAppearance(
      hairIndex: hairIndex ?? this.hairIndex,
      eyeIndex: eyeIndex ?? this.eyeIndex,
      mouthIndex: mouthIndex ?? this.mouthIndex,
      headIndex: headIndex ?? this.headIndex,
      hairColorR: hairColorR ?? this.hairColorR,
      hairColorG: hairColorG ?? this.hairColorG,
      hairColorB: hairColorB ?? this.hairColorB,
      hairAssets: hairAssets,
      eyeAssets: eyeAssets,
      mouthAssets: mouthAssets,
      headAssets: headAssets,
    );
  }
}


