import 'package:dungeons_and_dragons/custom_widgets/shader_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../generated/assets.dart';
import '../providers/appearance_provider.dart';

class CharacterCard extends ConsumerWidget {
  const CharacterCard({//Todo use a characterappearence instance instead
    super.key,
    required this.headIndex,
    required this.hairIndex,
    required this.mouthIndex,
    required this.eyeIndex,
    required this.action,
    required this.deleteAction,
    required this.characterName,
    required this.hairColor,
    required this.eyeColor,
  });
  final VoidCallback action;
  final VoidCallback deleteAction;
  final String characterName;
  final int headIndex;
  final int hairIndex;
  final int mouthIndex;
  final int eyeIndex;
  final Color hairColor;
  final Color eyeColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO Relativelayout
    final appearanceState = ref.watch(characterAppearanceStateProvider);
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      shape: const RoundedRectangleBorder(),
      color: Colors.grey,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.blue,
                  width: 4,
                ),
              ),
              child: Stack(
                children: [
                  ShaderImage(
                      imageSrc: appearanceState.hairAssets[hairIndex],
                      modColor: hairColor),
                  Image.asset(
                    appearanceState.headAssets[headIndex],
                  ),
                  Image.asset(
                    appearanceState.mouthAssets[mouthIndex],
                  ),
                  ShaderImage(
                    imageSrc: appearanceState.eyeAssets[eyeIndex],
                    modColor: eyeColor,
                  ),
                  Image.asset(
                    Assets.appearanceBody,
                  ),
                ],
              ),
            ),
            Text(characterName),
            Row(
              children: [
                GestureDetector(
                    onTap: deleteAction,
                    child:
                        Icon(Icons.delete, color: Colors.red[700], size: 30)),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: action,
                  child: Icon(Icons.play_arrow,
                      color: Colors.greenAccent[400], size: 30),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
