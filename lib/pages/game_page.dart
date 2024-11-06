import 'package:dungeons_and_dragons/custom_widgets/item_slot.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/shader_image.dart';
import '../data/appearance.dart';
import '../generated/assets.dart';

class GamePage extends StatelessWidget {
  const GamePage({required this.appearance, super.key});
  final Appearance appearance;

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
              flex: 55,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ItemSlot(),
                  Expanded(
                    flex: 5,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 45,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 8, left: 4),
                            child: Container(
                              color: Colors.blue,
                              child: Stack(
                                fit: StackFit.expand,
                                children: [
                                  ShaderImage(
                                    imageSrc: appearance
                                        .hairAssets[appearance.hairIndex],
                                    modColor: hairColor,
                                  ),
                                  Image.asset(
                                    appearance.headAssets[appearance.headIndex],
                                  ),
                                  Image.asset(
                                    appearance
                                        .mouthAssets[appearance.mouthIndex],
                                  ),
                                  ShaderImage(
                                    imageSrc: appearance
                                        .eyeAssets[appearance.eyeIndex],
                                    modColor: eyeColor,
                                  ),
                                  Image.asset(
                                    Assets.appearanceBody,
                                    fit: BoxFit.fill,
                                  ),

                                  //EXP BAR
                                  Align(
                                    alignment: Alignment.bottomLeft,
                                    child: FractionallySizedBox(
                                      heightFactor: 0.15,
                                      widthFactor: 1,
                                      child: Container(
                                        color: Colors.brown,
                                        child: Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Container(
                                            color: Colors.grey[800],
                                            child: Stack(
                                              children: [
                                                Align(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: FractionallySizedBox(
                                                    widthFactor: 0.65,
                                                    child: Container(
                                                      color: Colors.green[800],
                                                    ),
                                                  ),
                                                ),
                                                const Center(
                                                  child: Text(
                                                    "Level 69",
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                    fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          //TODO AUTOSIZE TEXT
                          flex: 55,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 8, right: 8, left: 4, bottom: 8),
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              color: Colors.green,
                              child: const Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Vitality"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Endurance"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Strength"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text("Intelligence"),
                                        Text("0")
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Agility"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Inferno"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Faith"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Dark"), Text("0")],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 8, right: 8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [Text("Spirit"), Text("0")],
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
              flex: 35,
              child: Column(
                children: [
                  Expanded(
                    flex: 65,
                    child: Container(
                      color: Colors.red,
                      child: GridView.count(
                        crossAxisCount: 5,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                        padding: const EdgeInsets.all(10),
                        children: List.generate(
                            10, (_) => Container(color: Colors.green)),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child: Container(
                      color: Colors.amber,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
