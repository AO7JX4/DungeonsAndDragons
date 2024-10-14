import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeons_and_dragons/abstract/loadable_widget.dart';
import 'package:dungeons_and_dragons/custom_widgets/character_card.dart';
import 'package:dungeons_and_dragons/custom_widgets/signing_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'auth_page.dart';
import 'character_creation_page.dart';
import 'game_page.dart';

class CharacterPage extends LoadableWidget {
  const CharacterPage({super.key});

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  //Sign the user out
  void signOut() async {
    // Show loading circle
    widget.showLoadingPotion(context);

    try {
      //Sign out user
      await FirebaseAuth.instance.signOut();

      // Navigate to auth page
      widget.hideLoadingPotion(context); // Close loading circle
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const AuthPage();
        }),
      );
    } on FirebaseAuthException catch (e) {
      //When error happens
      // Close loading circle
      widget.hideLoadingPotion(context);

      // Show error
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign Out Failed'),
            content: Text(e.message ?? 'Unknown error occurred'),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  //Action for navigating to the character creating menu
  void moveToCharacterCreationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const CharacterCreationPage();
    }));
  }

  //Action for choosing character and playing the game
  void chooseCharacter() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const GamePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference _characters = FirebaseFirestore.instance.collection("Characters");
    final User? _currentUser = FirebaseAuth.instance.currentUser;

    Stream<QuerySnapshot> getCharacters() {
      return _characters
          .where('userid', isEqualTo: _currentUser?.uid)
          .snapshots();
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose an adventurer"),
        automaticallyImplyLeading: false,
        actions: [
          GestureDetector(
            onTap: signOut,
            child: const Icon(Icons.logout),
          )
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: getCharacters(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading characters'));
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No characters found'));
          }

          // Get the list of characters
          List<DocumentSnapshot> characters = snapshot.data!.docs;

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = characters[index];
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;
              String characterName = data["name"];

              return CharacterCard(
                action: chooseCharacter,
                characterName: characterName,
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: SigningButton(
          action: moveToCharacterCreationPage,
          buttonText: "Recruit new adventurer",
        ),
      ),
    );
  }
}
