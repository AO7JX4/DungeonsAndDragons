import 'package:dungeons_and_dragons/generated/assets.dart';
import 'package:flutter/material.dart';

class PotionLoadingIndicator extends StatelessWidget {
  const PotionLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          width: 200.0,//TODO make adaptive size
          height: 200.0,
          child: Image.asset(Assets.assetsLoadingPotion)),
    );
  }
}
