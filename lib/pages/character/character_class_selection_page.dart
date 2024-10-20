import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../custom_widgets/infinite_carousel.dart';
import '../../generated/assets.dart';
import '../../providers/carousel_index_provider.dart';

class CharacterClassSelectionPage extends ConsumerStatefulWidget {
  const CharacterClassSelectionPage({super.key});

  @override
  ConsumerState<CharacterClassSelectionPage> createState() =>
      _CharacterClassSelectionPageState();
}

class _CharacterClassSelectionPageState
    extends ConsumerState<CharacterClassSelectionPage> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = ref.watch(currentCarouselIndexProvider);

    String imageAsset;
    switch (currentIndex) {
      case 0:
        imageAsset = Assets.assetsInfernal;
        break;
      case 1:
        imageAsset = Assets.assetsFallen;
        break;
      case 2:
        imageAsset = Assets.assetsCelestial;
        break;
      case 3:
        imageAsset = Assets.assetsCelestial;
        break;
      case 4:
        imageAsset = Assets.assetsCelestial;
        break;
      case 5:
        imageAsset = Assets.assetsSpectral;
        break;
      default:
        imageAsset = Assets.assetsPlaceholder;
    }

    String description;
    switch (currentIndex) {
      case 0:
        description = "Infernal description";
        break;
      case 1:
        description = "Fallen description";
        break;
      case 2:
        description = "Celestial description";
        break;
      case 3:
        description = "Lunar description";
        break;
      case 4:
        description = "Umbral description";
        break;
      case 5:
        description = "Spectral description";
        break;
      default:
        description = "Description not found";
    }

    return Column(
      children: [
        Expanded(
          flex: 85,
          child: Container(
            color: Colors.red,
            child: Stack(
              fit: StackFit.expand,
              children: [
                // AnimatedSwitcher added for smooth image transitions
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  },
                  child: Image.asset(
                    imageAsset,
                    key: ValueKey<String>(imageAsset),
                    fit: BoxFit.cover,
                  ),
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
                                              height: MediaQuery.sizeOf(context)
                                                  .height,
                                              color: Colors.green,
                                              child:  AnimatedSwitcher(
                                                duration: const Duration(milliseconds: 500),
                                                transitionBuilder: (Widget child,
                                                    Animation<double> animation) {
                                                  return FadeTransition(
                                                    opacity: animation,
                                                    child: child,
                                                  );
                                                },
                                                child: Text(
                                                  description,
                                                  key: ValueKey<String>(description),
                                                ),
                                              ),
                                            ),
                                          ), //Todo layoutbuilder
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 50,
                                    child: Align(
                                      alignment: Alignment.bottomCenter,
                                      child: AnimatedSwitcher(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        transitionBuilder: (Widget child,
                                            Animation<double> animation) {
                                          return FadeTransition(
                                            opacity: animation,
                                            child: child,
                                          );
                                        },
                                        child: Text(
                                          description,
                                          key: ValueKey<String>(description),
                                        ),
                                      ),
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
