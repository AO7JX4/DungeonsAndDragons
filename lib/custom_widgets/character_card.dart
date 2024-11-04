import 'package:dungeons_and_dragons/custom_widgets/shader_image.dart';
import 'package:flutter/material.dart';
import '../generated/assets.dart';
import '../pages/game_page.dart';
import '../providers/appearance_provider.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.deleteAction,
    required this.characterName,
    required this.appearance,
  });
  final VoidCallback deleteAction;
  final String characterName;
  final CharacterAppearance appearance;

  @override
  Widget build(BuildContext context) {

    final eyeColor = Color.fromRGBO(
      appearance.eyeColorR.toInt(),
      appearance.eyeColorG.toInt(),
      appearance.eyeColorB.toInt(),
      1.0,
    );

    final hairColor = Color.fromRGBO(
      appearance.hairColorR.toInt(),
      appearance.hairColorG.toInt(),
      appearance.hairColorB.toInt(),
      1.0,
    );

    void chooseCharacter() {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return GamePage(appearance: appearance);
      }));
    }
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
              width: 100, //Todo relative layout
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
                      imageSrc: appearance.hairAssets[appearance.hairIndex],
                      modColor: hairColor),
                  Image.asset(
                    appearance.headAssets[appearance.headIndex],
                  ),
                  Image.asset(
                    appearance.mouthAssets[appearance.mouthIndex],
                  ),
                  ShaderImage(
                    imageSrc: appearance.eyeAssets[appearance.eyeIndex],
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
                  onTap: chooseCharacter,
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
