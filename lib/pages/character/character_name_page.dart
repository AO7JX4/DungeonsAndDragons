import 'package:dungeons_and_dragons/custom_widgets/attribute_row.dart';
import 'package:dungeons_and_dragons/custom_widgets/signing_button.dart';
import 'package:dungeons_and_dragons/providers/attribute_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../generated/assets.dart';

class CharacterNamePage extends ConsumerStatefulWidget {
  const CharacterNamePage(
      {super.key, required this.action, required this.nameController});
  final VoidCallback action;
  final TextEditingController nameController;

  @override
  ConsumerState<CharacterNamePage> createState() => _CharacterNamePageState();
}

class _CharacterNamePageState extends ConsumerState<CharacterNamePage> {
  @override
  Widget build(BuildContext context) {
    final attributeNotifier =
        ref.read(characterAttributeStateProvider.notifier);
    final attributeProvider = ref.watch(characterAttributeStateProvider);
    final unspentPoints = attributeNotifier.unspentPoints;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 10,
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "Distribute your attributes",
                  style: TextStyle(color: Colors.amber, fontSize: 30),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 70,
            child: Column(
              children: [
                Expanded(
                  flex: 85,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    height: MediaQuery.sizeOf(context).height,
                    color: Colors.purple,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 7,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: const Text("Basic Attributes"),
                          ),
                        ),
                        Expanded(
                          flex: 33,
                          child: Container(
                            color: Colors.green,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 33,
                                  child: AttributeRow(
                                    attribute: "Strength",
                                    base: attributeProvider.strength,
                                    action: () =>
                                        attributeNotifier.updateStrength(1),
                                  ),
                                ),
                                Expanded(
                                  flex: 33,
                                  child: AttributeRow(
                                    attribute: "Agility",
                                    base: attributeProvider.agility,
                                    action: () =>
                                        attributeNotifier.updateAgility(1),
                                  ),
                                ),
                                Expanded(
                                  flex: 33,
                                  child: AttributeRow(
                                    attribute: "Intelligence",
                                    base: attributeProvider.intelligence,
                                    action: () =>
                                        attributeNotifier.updateIntelligence(1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 7,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            color: Colors.red,
                            child: const Text("Special Attributes"),
                          ),
                        ),
                        Expanded(
                          flex: 44,
                          child: Container(
                            color: Colors.amber,
                            child: Column(
                              children: [
                                Expanded(
                                  flex: 25,
                                  child: AttributeRow(
                                    attribute: "Inferno",
                                    base: attributeProvider.inferno,
                                    action: () =>
                                        attributeNotifier.updateInferno(1),
                                  ),
                                ),
                                Expanded(
                                  flex: 25,
                                  child: AttributeRow(
                                    attribute: "Dark",
                                    base: attributeProvider.dark,
                                    action: () =>
                                        attributeNotifier.updateDark(1),
                                  ),
                                ),
                                Expanded(
                                  flex: 25,
                                  child: AttributeRow(
                                    attribute: "Faith",
                                    base: attributeProvider.faith,
                                    action: () =>
                                        attributeNotifier.updateFaith(1),
                                  ),
                                ),
                                Expanded(
                                  flex: 25,
                                  child: AttributeRow(
                                    attribute: "Spirit",
                                    base: attributeProvider.spirit,
                                    action: () =>
                                        attributeNotifier.updateSpirit(1),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 9,
                          child: Container(
                            color: Colors.purple,
                            child: Row(
                              children: [
                                const Expanded(
                                    flex: 85, child: Text("Unspent points: ")),
                                Expanded(
                                    flex: 5,
                                    child: Text(unspentPoints.toString())),
                                Expanded(
                                  flex: 10,
                                  child: unspentPoints > 0
                                      ? Icon(
                                          Icons.warning,
                                          color: Colors.orange[800],
                                        )
                                      : const Icon(
                                          Icons.warning,
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 15,
                  child: Container(
                    color: Colors.blue,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 80,
                          child: TextField(
                            controller: widget.nameController,
                            decoration: const InputDecoration(
                              hintText: "Name",
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Container(
                            color: Colors.green,
                            child: Image.asset(Assets.assetsPlaceholder),
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
      bottomNavigationBar: BottomAppBar(
        child: Center(
          child: SigningButton(action: widget.action, buttonText: "Hire"),
        ),
      ),
    );
  }
}
