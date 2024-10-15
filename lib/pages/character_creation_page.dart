import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeons_and_dragons/pages/character_class_selection_page.dart';
import 'package:dungeons_and_dragons/providers/carousel_index_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../custom_widgets/signing_button.dart';
import '../providers/appearance_provider.dart';
import 'character_appearance_page.dart';
import 'character_name_page.dart';
import 'choose_character_page.dart';

class CharacterCreationPage extends ConsumerStatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  ConsumerState<CharacterCreationPage> createState() =>
      _CharacterCreationPageState();
}

class _CharacterCreationPageState extends ConsumerState<CharacterCreationPage> {
  int _selectedPageIndex = 0;

  void _showClassPage() {
    setState(() {
      _selectedPageIndex = 0;
    });
  }

  void _showAppearancePage() {
    setState(() {
      _selectedPageIndex = 1;
    });
  }

  void _showNamePage() {
    setState(() {
      _selectedPageIndex = 2;
    });
  }



  @override
  Widget build(BuildContext context) {
    int currentIndex = ref.watch(currentCarouselIndexProvider);
    final appearanceState = ref.watch(characterAppearanceStateProvider);
    final TextEditingController nameController = TextEditingController();

    final CollectionReference characters = FirebaseFirestore.instance.collection("Characters");
    final CollectionReference appearance = FirebaseFirestore.instance.collection("Appearance");
    final CollectionReference inventory = FirebaseFirestore.instance.collection("Inventory");
    final User? currentUser = FirebaseAuth.instance.currentUser; //TODO riverpod

    String getClass(){ //Todo put this logic in class selection so we dont need currentindex here to rebuild whole tree
      String characterClass="";
      switch(currentIndex){
        case 0:
          characterClass="Celestial";
          break;
        case 1:
          characterClass="Fallen";
          break;
        case 2:
          characterClass="Infernal";
          break;
        case 3:
          characterClass="Lunar";
          break;
        case 4:
          characterClass="Umbral";
          break;
        case 5:
          characterClass="Spectral";
          break;
      }
      return characterClass;
    }

    Future<void> createCharacterForUser() async {

      DocumentReference characterRef = characters.doc();
      DocumentReference appearanceRef = appearance.doc();
      DocumentReference inventoryRef = inventory.doc();


      await characterRef.set({
        'id': characterRef.id,
        'name': nameController.text.trim(),
        'stats': "test", //Todo
        "class": getClass(),
        "user_id": currentUser!.uid,
      });

      await appearanceRef.set({
        'id': appearanceRef.id,
        "head": appearanceState.headIndex,
        "hair": appearanceState.hairIndex,
        "eye": appearanceState.eyeIndex,
        "mouth": appearanceState.mouthIndex,
        "character_id": characterRef.id
      });

      await inventoryRef.set({
        'id': inventoryRef.id,
        "userid": currentUser.uid,
        "item_id": 1 //Todo
      });


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const CharacterPage();
      }));
    }



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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: _showClassPage,
                      child: const Text("Class"),
                    ),
                    GestureDetector(
                      onTap: _showAppearancePage,
                      child: const Text("Appearance"),
                    ),
                    GestureDetector(
                      onTap: _showNamePage,
                      child: const Text("Name"),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 85,
              child: IndexedStack(
                index: _selectedPageIndex,
                children: [
                  const CharacterClassSelectionPage(),
                  const CharacterAppearancePage(),
                  CharacterNamePage(action: createCharacterForUser, nameController: nameController,)
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SigningButton(action: (){}, buttonText: "Appearance"),
      ),
    );
  }
}
