import 'package:dungeons_and_dragons/custom_widgets/signing_button.dart';
import 'package:flutter/material.dart';

import '../generated/assets.dart';

class CharacterNamePage extends StatefulWidget {
  const CharacterNamePage(
      {super.key, required this.action, required this.nameController});
  final VoidCallback action;
  final TextEditingController nameController;

  @override
  State<CharacterNamePage> createState() => _CharacterNamePageState();
}

class _CharacterNamePageState extends State<CharacterNamePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.blue,
            child: const Center(
              child: Text(
                "Choose your name",
                style: TextStyle(
                    color: Colors.amber,
                    fontSize: 40), //TODO Autisize text+button
              ),
            ),
          ),
        ),
        Expanded(
          flex: 70,
          child: Column(
            children: [
              Expanded(
                flex: 50,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                  color: Colors.red,
                  child: const Align(
                      alignment: Alignment.bottomLeft, child: Text("dta")),
                ),
              ),
              Expanded(
                flex: 50,
                child: Container(
                  color: Colors.purple,
                  child: Align(
                    alignment: Alignment.topCenter,
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
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 20,
          child: Container(
            width: MediaQuery.sizeOf(context).width,
            color: Colors.red,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                child: SigningButton(
                    action: widget.action, buttonText: "buttonText"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
