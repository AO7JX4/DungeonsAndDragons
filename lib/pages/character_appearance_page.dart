import 'package:dungeons_and_dragons/generated/assets.dart';
import 'package:dungeons_and_dragons/providers/appearance_provider.dart'; // Import the appearance provider
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterAppearancePage extends ConsumerStatefulWidget {
  const CharacterAppearancePage({super.key});

  @override
  ConsumerState<CharacterAppearancePage> createState() => _CharacterAppearancePageState();
}

class _CharacterAppearancePageState extends ConsumerState<CharacterAppearancePage> {
  @override
  Widget build(BuildContext context) {

    final appearanceState = ref.watch(characterAppearanceStateProvider);

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
                    child: const Placeholder(),
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
                      ref.read(characterAppearanceStateProvider.notifier).changeHeadIndex();
                    },
                    child: const Icon(Icons.headset),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(characterAppearanceStateProvider.notifier).changeHairIndex();
                    },
                    child: const Icon(Icons.line_axis),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(characterAppearanceStateProvider.notifier).changeEyeIndex();
                    },
                    child: const Icon(Icons.remove_red_eye),
                  ),
                ),
                Expanded(
                  flex: 20,
                  child: GestureDetector(
                    onTap: () {
                      ref.read(characterAppearanceStateProvider.notifier).changeMouthIndex();
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
                          child: Image.asset(appearanceState.headAssets[appearanceState.headIndex]),
                        ),
                        // Use hairAssets and eyeAssets from appearanceState
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            appearanceState.hairAssets[appearanceState.hairIndex],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(
                            appearanceState.eyeAssets[appearanceState.eyeIndex],
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Image.asset(appearanceState.mouthAssets[appearanceState.mouthIndex]),
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
