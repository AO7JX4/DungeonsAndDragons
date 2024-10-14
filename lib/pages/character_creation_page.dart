import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeons_and_dragons/pages/character_class_selection_page.dart';
import 'package:dungeons_and_dragons/providers/carousel_index_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../custom_widgets/signing_button.dart';
import 'character_appearance_page.dart';
import 'character_name_page.dart';
import 'choose_character_page.dart'; // Import the other page

class CharacterCreationPage extends ConsumerStatefulWidget {
  const CharacterCreationPage({super.key});

  @override
  ConsumerState<CharacterCreationPage> createState() =>
      _CharacterCreationPageState();
}

class _CharacterCreationPageState extends ConsumerState<CharacterCreationPage> {
  int _selectedPageIndex =
      0; // Use an integer to keep track of the current page

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
    int _currentIndex = ref.watch(currentIndexProvider);
    final CollectionReference _characters = FirebaseFirestore.instance.collection("Characters");
    final User? _currentUser = FirebaseAuth.instance.currentUser; //TODO riverpod

    Future<void> _createCharacterForUser() async {

      DocumentReference docRef = _characters.doc(); // Ez létrehoz egy új dokumentum referenciát

      await docRef.set({
        'id': docRef.id,
        'name': "test",
        'stats': "test",
        "userid": _currentUser!.uid,
        "class": _currentIndex
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
                  CharacterNamePage(action: _createCharacterForUser)
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
