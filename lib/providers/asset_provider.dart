
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../generated/assets.dart';

part 'asset_provider.g.dart';

@riverpod
List<String> headAssets(HeadAssetsRef ref){

  return [Assets.appearanceHead1,
    Assets.appearanceHead2,
    Assets.appearanceHead3,];
}

@riverpod
List<String> eyeAssets(EyeAssetsRef ref){
  return [ Assets.appearanceEye1,
    Assets.appearanceEye2,
    Assets.appearanceEye3,];
}

@riverpod
List<String> hairAssets(HairAssetsRef ref){
  return [Assets.appearanceHair1,
    Assets.appearanceHair2,
    Assets.appearanceHair3,];
}

@riverpod
List<String> mouthAssets(MouthAssetsRef ref){
  return [Assets.appearanceMouth1,
    Assets.appearanceMouth2,
    Assets.appearanceMouth3,];
}