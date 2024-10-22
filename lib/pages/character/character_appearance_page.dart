import 'package:dungeons_and_dragons/custom_widgets/color_slider.dart';
import 'package:dungeons_and_dragons/custom_widgets/shader_image.dart';
import 'package:dungeons_and_dragons/generated/assets.dart';
import 'package:dungeons_and_dragons/providers/appearance_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterAppearancePage extends ConsumerStatefulWidget {
  const CharacterAppearancePage({super.key});

  @override
  ConsumerState<CharacterAppearancePage> createState() =>
      _CharacterAppearancePageState();
}

class _CharacterAppearancePageState
    extends ConsumerState<CharacterAppearancePage> {

  int _selectedPageIndex = 0;

  void _showHairColorSlider() {
    setState(() {
      _selectedPageIndex = 0;
    });
  }

  void _showEyeColorSlider() {
    setState(() {
      _selectedPageIndex = 1;
    });
  }

  void _showSmth() { //TODO put smth here
    setState(() {
      _selectedPageIndex = 2;
    });
  }


  @override
  Widget build(BuildContext context) {
    final appearanceState = ref.watch(characterAppearanceStateProvider);

    final hairColor = Color.fromRGBO(
      appearanceState.hairColorR.toInt(),
      appearanceState.hairColorG.toInt(),
      appearanceState.hairColorB.toInt(),
      1.0,
    );

    final eyeColor = Color.fromRGBO(
      appearanceState.eyeColorR.toInt(),
      appearanceState.eyeColorG.toInt(),
      appearanceState.eyeColorB.toInt(),
      1.0,
    );

    return Column(
      children: [
        Expanded(
          flex: 40,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.greenAccent,
            child: Column(
              children: [
                const Expanded(
                  flex: 25,
                  child: Text(
                    "Modify your look",
                    style: TextStyle(color: Colors.amber, fontSize: 40),
                  ),
                ),
                Expanded(
                  flex: 75,
                  child: Container(
                    color: Colors.blue,
                    child: IndexedStack(index: _selectedPageIndex,children: [
                      ColorSlider(
                        colorValueR: appearanceState.hairColorR,
                        colorValueG: appearanceState.hairColorG,
                        colorValueB: appearanceState.hairColorB,
                        onRChanged: (newValue) {
                          ref
                              .read(characterAppearanceStateProvider
                                  .notifier)
                              .updateHairRColor(newValue);
                        },
                        onGChanged: (newValue) {
                          ref
                              .read(characterAppearanceStateProvider
                                  .notifier)
                              .updateHairGColor(newValue);
                        },
                        onBChanged: (newValue) {
                          ref
                              .read(characterAppearanceStateProvider
                                  .notifier)
                              .updateHairBColor(newValue);
                        },
                      ),
                      ColorSlider(
                        colorValueR: appearanceState.eyeColorR,
                        colorValueG: appearanceState.eyeColorG,
                        colorValueB: appearanceState.eyeColorB,
                        onRChanged: (newValue) {
                          ref
                              .read(characterAppearanceStateProvider
                                  .notifier)
                              .updateEyeRColor(newValue);
                        },
                        onGChanged: (newValue) {
                          ref
                              .read(characterAppearanceStateProvider
                                  .notifier)
                              .updateEyeGColor(newValue);
                        },
                        onBChanged: (newValue) {
                          ref
                              .read(characterAppearanceStateProvider
                                  .notifier)
                              .updateEyeBColor(newValue);
                        },
                      ),
                      const Placeholder() //TODO smth here
                    ]),
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 10,
          child: Container(
            color: Colors.purple,
            child: Row(
              // Top Side buttons
              children: [
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(characterAppearanceStateProvider.notifier)
                          .changeHeadIndex();
                    },
                    child: const Icon(Icons.headset),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(characterAppearanceStateProvider.notifier)
                          .changeHairIndex();
                    },
                    child: const Icon(Icons.line_axis),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(characterAppearanceStateProvider.notifier)
                          .changeEyeIndex();
                    },
                    child: const Icon(Icons.remove_red_eye),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref
                          .read(characterAppearanceStateProvider.notifier)
                          .changeMouthIndex();
                    },
                    child: const Icon(Icons.phone_in_talk),
                  ),
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
                    child: Column(
                      children: [
                        Expanded(
                          flex: 33,
                          child: GestureDetector(
                            onTap: _showHairColorSlider,
                              child: const Icon(Icons.color_lens)),
                        ),
                        Expanded(
                          flex: 33,
                          child: GestureDetector(
                            onTap: _showEyeColorSlider,
                              child: const Icon(Icons.colorize)),
                        ),
                        Expanded(
                          flex: 33,
                          child: GestureDetector(
                            onTap: _showSmth,
                              child: const Icon(Icons.icecream)),
                        ),
                      ],
                    ),
                  ),
                ),
                // Character appearance card
                Expanded(
                  flex: 70,
                  child: Container(
                    color: Colors.red,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(Assets.appearanceBody),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(appearanceState
                              .headAssets[appearanceState.headIndex]),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ShaderImage(
                            imageSrc: appearanceState
                                .hairAssets[appearanceState.hairIndex],
                            modColor: hairColor,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: ShaderImage(
                            imageSrc: appearanceState
                                .eyeAssets[appearanceState.eyeIndex],
                            modColor: eyeColor,
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(appearanceState
                              .mouthAssets[appearanceState.mouthIndex]),
                        ),
                      ],
                    ),
                  ),
                ),
                // Right Side buttons
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
