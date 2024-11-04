import 'package:dungeons_and_dragons/custom_widgets/item_slot.dart';
import 'package:dungeons_and_dragons/providers/appearance_provider.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/shader_image.dart';
import '../generated/assets.dart';

class GamePage extends StatelessWidget {
  const GamePage({required this.appearance, super.key});
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

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Container(
        color: Colors.purple,
        child: Column(
          children: [
            const Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Character Name"),
                  Text("Character Class"),
                ],
              ),
            ),
            Expanded(
              flex: 50, // This will take half of the available height
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ItemSlot(), // Assuming ItemSlot is a widget you defined
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              color: Colors.blue,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ShaderImage(
                                    imageSrc: appearance.hairAssets[appearance.hairIndex],
                                    modColor: hairColor,
                                  ),
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
                                    Assets.appearanceBody, fit: BoxFit.fill,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: Colors.green,
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 8.0, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Strength"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Dexterity"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Intelligence"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Health"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(bottom: 8, left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [Text("Luck"), Text("0.0%")],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Inventory"),
                  Text("Skills"),
                ],
              ),
            ),
            Expanded(
              flex: 40,
              child: Container(
                color: Colors.amber,
                child: Column(
                  children: [
                    Expanded(
                      flex: 55,
                      child: Container(
                        color: Colors.red,
                        child: GridView.count(
                          crossAxisCount: 5,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          padding: const EdgeInsets.all(10),
                          children: List.generate(10, (_) => Container(color: Colors.green)),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 45,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.3, // Item image takes 30%
                              color: Colors.blue,
                              child: Image.asset(Assets.assetsPlaceholder),
                            ),
                          ),
                          Expanded(
                            flex: 7,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: MediaQuery.of(context).size.height,
                                color: Colors.purple,
                                child: const Text(
                                  "This is a very long description of this amazing item",
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
