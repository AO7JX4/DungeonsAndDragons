class Appearance {
  final int hairIndex;
  final int eyeIndex;
  final int mouthIndex;
  final int headIndex;
  final double hairColorR;
  final double hairColorG;
  final double hairColorB;
  final double eyeColorR;
  final double eyeColorG;
  final double eyeColorB;
  final List<String> hairAssets;
  final List<String> eyeAssets;
  final List<String> mouthAssets;
  final List<String> headAssets;

  Appearance({
    required this.hairIndex,
    required this.eyeIndex,
    required this.mouthIndex,
    required this.headIndex,
    required this.hairColorR,
    required this.hairColorG,
    required this.hairColorB,
    required this.eyeColorR,
    required this.eyeColorG,
    required this.eyeColorB,
    required this.hairAssets,
    required this.eyeAssets,
    required this.mouthAssets,
    required this.headAssets,
  });

  Appearance copyWith({
    int? hairIndex,
    int? eyeIndex,
    int? mouthIndex,
    int? headIndex,
    double? hairColorR,
    double? hairColorG,
    double? hairColorB,
    double? eyeColorR,
    double? eyeColorG,
    double? eyeColorB,
  }) {
    return Appearance(
      hairIndex: hairIndex ?? this.hairIndex,
      eyeIndex: eyeIndex ?? this.eyeIndex,
      mouthIndex: mouthIndex ?? this.mouthIndex,
      headIndex: headIndex ?? this.headIndex,
      hairColorR: hairColorR ?? this.hairColorR,
      hairColorG: hairColorG ?? this.hairColorG,
      hairColorB: hairColorB ?? this.hairColorB,
      eyeColorR: eyeColorR ?? this.eyeColorR,
      eyeColorG: eyeColorG ?? this.eyeColorG,
      eyeColorB: eyeColorB ?? this.eyeColorB,
      hairAssets: hairAssets,
      eyeAssets: eyeAssets,
      mouthAssets: mouthAssets,
      headAssets: headAssets,
    );
  }
}
