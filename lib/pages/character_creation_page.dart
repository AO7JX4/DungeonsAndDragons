import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod csomag importálása

import '../custom_widgets/signing_button.dart';
import '../custom_widgets/infinite_carousel.dart';
import '../generated/assets.dart';
import '../providers/carousel_index_provider.dart'; // A provider fájl importálása

class CharacterCreationPage extends ConsumerStatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  ConsumerState<CharacterCreationPage> createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends ConsumerState<CharacterCreationPage> {
  @override
  Widget build(BuildContext context) {

    final currentIndex = ref.watch(currentIndexProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
                flex: 15,
                child: Container(
                  color: Colors.green,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Class"),
                      Text("Appearance"),
                    ],
                  ),
                )),
            Expanded(
              flex: 85,
              child: Container(
                color: Colors.red,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      Assets.assetsItemSlotHero,
                      fit: BoxFit.fill,
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
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: FractionallySizedBox(
                                          widthFactor: 0.2,
                                          heightFactor: 0.5,
                                          child: Image.asset(
                                            Assets.assetsPlaceholder,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                      const Align(
                                        alignment: Alignment.topCenter,
                                        child: Text(
                                          "data",
                                        ),
                                      ),
                                      const Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(
                                          "data",
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
                                  child: InfiniteCarousel(), // Riverpod providerrel figyeljük az indexet
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
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SigningButton(action: () {}, buttonText: "Appearance"),
      ),
    );
  }
}
