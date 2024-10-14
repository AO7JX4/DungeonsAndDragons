import 'package:flutter/material.dart';

import '../generated/assets.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({super.key, required this.action, required this.characterName});
  final VoidCallback action;
  final String characterName;

  @override
  Widget build(BuildContext context) { //TODO Relativelayout
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
              child: Image.asset(
                Assets.assetsPlaceholder,
              ),
            ),
            Text(characterName),
            Row(
              children: [
                GestureDetector(
                    onTap: (){}, //TODO: delete
                    child: Icon(Icons.delete,
                        color: Colors.red[700], size: 30)),
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
