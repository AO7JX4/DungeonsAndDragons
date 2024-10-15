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
    widget.showLoadingPotion(context);
    try {
      await FirebaseAuth.instance.signOut();
      widget.hideLoadingPotion(context);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) {
          return const AuthPage();
        }),
      );
    } on FirebaseAuthException catch (e) {
      widget.hideLoadingPotion(context);
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

  void moveToCharacterCreationPage() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const CharacterCreationPage();
    }));
  }

  void chooseCharacter() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
      return const GamePage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final CollectionReference characters = FirebaseFirestore.instance.collection("Characters");
    final User? currentUser = FirebaseAuth.instance.currentUser;

    Stream<QuerySnapshot> getCharacters() {
      return characters.where('user_id', isEqualTo: currentUser?.uid).snapshots();
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

          List<DocumentSnapshot> characters = snapshot.data!.docs;

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (context, index) {
              DocumentSnapshot characterDocument = characters[index];
              Map<String, dynamic> characterData = characterDocument.data() as Map<String, dynamic>;
              String characterName = characterData["name"];

              // Fetch the appearances associated with this character
              String characterId = characterDocument.id; // Assuming document ID is used as character_id

              return StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('Appearance') // Use your actual collection name
                    .where('character_id', isEqualTo: characterId)
                    .snapshots(),
                builder: (context, appearanceSnapshot) {
                  if (appearanceSnapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (appearanceSnapshot.hasError) {
                    return const Center(child: Text('Error loading appearances'));
                  }

                  if (!appearanceSnapshot.hasData || appearanceSnapshot.data!.docs.isEmpty) {
                    return const Text('No appearances found');
                  }

                  // Get the list of appearances
                  List<DocumentSnapshot> appearances = appearanceSnapshot.data!.docs;
                  // Assuming you want to use only the first appearance for simplicity
                  Map<String, dynamic> appearanceData = appearances.first.data() as Map<String, dynamic>;

                  int headIndex = appearanceData["head"] ?? 0;
                  int hairIndex = appearanceData["hair"] ?? 0;
                  int mouthIndex = appearanceData["mouth"] ?? 0;
                  int eyeIndex = appearanceData["eye"] ?? 0;

                  return CharacterCard(
                    hairIndex: hairIndex,
                    headIndex: headIndex,
                    mouthIndex: mouthIndex,
                    eyeIndex: eyeIndex,
                    action: chooseCharacter,
                    characterName: characterName,
                  );
                },
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
