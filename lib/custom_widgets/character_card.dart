import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../generated/assets.dart';
import '../providers/appearance_provider.dart';

class CharacterCard extends ConsumerWidget {
  const CharacterCard(
      {this.headIndex, this.hairIndex, this.mouthIndex, this.eyeIndex,super.key, required this.action, required this.characterName});
  final VoidCallback action;
  final String characterName;
  final int? headIndex;
  final int? hairIndex;
  final int? mouthIndex;
  final int? eyeIndex;

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
                  Image.asset(
                    appearanceState.hairAssets[hairIndex!],
                  ),
                  Image.asset(
                    appearanceState.headAssets[headIndex!],
                  ),
                  Image.asset(
                    appearanceState.mouthAssets[mouthIndex!],
                  ),
                  Image.asset(
                    appearanceState.eyeAssets[eyeIndex!],
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
                    onTap: () {}, //TODO: delete
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
