import 'package:flutter/material.dart';

import '../custom_widgets/infinite_carousel.dart';
import '../generated/assets.dart';

class CharacterClassSelectionPage extends StatefulWidget {
  const CharacterClassSelectionPage({super.key});

  @override
  State<CharacterClassSelectionPage> createState() =>
      _CharacterClassSelectionPageState();
}

class _CharacterClassSelectionPageState
    extends State<CharacterClassSelectionPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 85,
          child: Container(
            color: Colors.red,
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.asset(
                  Assets.assetsItemSlotHero,
                ),
                const Align(
                  alignment: Alignment.topCenter,
                  child: Text(
                    "Choose a class",
                    style: TextStyle(color: Colors.amber, fontSize: 40),
                  ),
                ),
                LayoutBuilder(
                  builder: (context, constraints) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Transform.translate(
                          offset: Offset(0, -constraints.maxHeight * 0.19),
                          child: FractionallySizedBox(
                            heightFactor: 0.25,
                            child: Container(
                              color: Colors.blue,
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 50,
                                    child: Container(
                                      color: Colors.purple,
                                      child: Row(
                                        children: [
                                          Expanded(
                                              flex: 15,
                                              child: Image.asset(
                                                  Assets.assetsPlaceholder)),
                                          Expanded(
                                              flex: 85,
                                              child: Container(
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                          .height,
                                                  color: Colors.green,
                                                  child: Text("data"))) //Todo layoutbuilder
                                        ],
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    flex: 50,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text("data"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: FractionallySizedBox(
                      heightFactor: 0.2,
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        width: MediaQuery.of(context).size.width,
                        color: Colors.purple,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              flex: 70,
                              child: InfiniteCarousel(),
                            ),
                            Expanded(flex: 30, child: Text("data")),
                          ],
                        ),
                      ),
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
