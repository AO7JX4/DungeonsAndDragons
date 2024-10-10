import 'package:dungeons_and_dragons/pages/character_class_selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Riverpod csomag importálása

import '../custom_widgets/signing_button.dart';

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
    print(currentIndex);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: const SafeArea(
        child: CharacterClassSelectionPage(),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SigningButton(action: () {}, buttonText: "Appearance"),
      ),
    );
  }
}
