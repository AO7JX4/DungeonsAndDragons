import 'package:dungeons_and_dragons/generated/assets.dart';
import 'package:flutter/material.dart';

class CharacterAppearancePage extends StatefulWidget {
  const CharacterAppearancePage({super.key});

  @override
  State<CharacterAppearancePage> createState() =>
      _CharacterAppearancePageState();
}

class _CharacterAppearancePageState extends State<CharacterAppearancePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 25,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.greenAccent,
            child: const Column(
              children: [
                Expanded(
                  flex: 50,
                  child: Text(
                    "Choose your race",
                    style: TextStyle(color: Colors.amber, fontSize: 40),
                  ),
                ),
                Expanded(
                  flex: 50,
                  child: Text(
                    "data",
                    style: TextStyle(color: Colors.amber, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 25,
          child: Container(
            color: Colors.purple,
            child: Row(
              children: [
                Expanded(
                  flex: 25,
                  child: Image.asset(Assets.assetsPlaceholder),
                ),
                Expanded(
                  flex: 25,
                  child: Image.asset(Assets.assetsItemSlotHero),
                ),
                Expanded(
                  flex: 25,
                  child: Image.asset(Assets.assetsPlaceholder),
                ),
                Expanded(
                  flex: 25,
                  child: Image.asset(Assets.assetsItemSlotHero),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 50,
          child: Container(
            color: Colors.red,
            child: Row(
              children: [
                Expanded(
                  flex: 15,
                  child: Container(
                    color: Colors.blue,
                    child: const Column(
                      children: [
                        Expanded(
                          flex: 33,
                          child: Icon(Icons.icecream),
                        ),
                        Expanded(
                          flex: 33,
                          child: Icon(Icons.icecream),
                        ),
                        Expanded(
                          flex: 33,
                          child: Icon(Icons.icecream),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 70,
                  child: Container(
                    color: Colors.red,
                    child: Stack(fit: StackFit.expand,children: [
                      Image.asset(Assets.assetsItemSlotHero),
                      Align(alignment: Alignment.bottomCenter,child: Text("data")),
                      Align(alignment: Alignment.bottomRight,child: Icon(Icons.icecream)),
                    ]),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    color: Colors.orange,
                    child: Column(
                      children: [
                        const Expanded(
                          flex: 33,
                          child: Icon(Icons.icecream),
                        ),
                        Expanded(
                          flex: 33,
                          child: Container(),
                        ),
                        const Expanded(
                          flex: 33,
                          child: Icon(Icons.icecream),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
