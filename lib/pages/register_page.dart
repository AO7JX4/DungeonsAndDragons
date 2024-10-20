import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dungeons_and_dragons/abstract/loadable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/information_collector_button.dart';
import '../custom_widgets/signing_button.dart';
import 'character/choose_character_page.dart';

class RegisterPage extends LoadableWidget {
  const RegisterPage({super.key, required this.showLoginPage});
  final VoidCallback showLoginPage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}



class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  final CollectionReference users = FirebaseFirestore.instance.collection("Users"); //Todo riverpodba berakni + leképzés osztályra

  //Register user
  Future signUp() async {
    if (isPasswordConfirmed()) {
      widget.showLoadingPotion(context); // Show loading

      try {
        // Firebase Authentication segítségével regisztráció
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );


        String uid = userCredential.user!.uid;

        await addUserToFirestore(uid);

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return const CharacterPage();
        }));
      } on FirebaseAuthException catch (e) {
        widget.hideLoadingPotion(context); // Hide loading
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: const Text('Registration Failed'),
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
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Passwords do not match'),
            actions: [
              TextButton(
                onPressed: null,
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> addUserToFirestore(String uid) async {
    return users.doc(uid).set({
      'id': uid,
      'username': _userNameController.text.trim(),
      'email': _emailController.text.trim(),
    });
  }

  bool isPasswordConfirmed() {
    return _passwordController.text.trim() == _confirmPasswordController.text.trim();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[500],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.brown[700],
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Welcome adventurer!",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
              const SizedBox(height: 10),
              // Username input
              InformationCollectorButton(
                textEditingController: _userNameController,
                hintText: "Username",
                hideText: false,
              ),
              const SizedBox(height: 10),
              // Email input
              InformationCollectorButton(
                textEditingController: _emailController,
                hintText: "Email",
                hideText: false,
              ),
              const SizedBox(height: 10),
              // Password input
              InformationCollectorButton(
                textEditingController: _passwordController,
                hintText: "Password",
                hideText: true,
              ),
              const SizedBox(height: 10),
              // Confirm password input
              InformationCollectorButton(
                textEditingController: _confirmPasswordController,
                hintText: "Confirm password",
                hideText: true,
              ),
              const SizedBox(height: 10),
              // Sign Up button
              SigningButton(
                action: signUp,
                buttonText: "Sign Up",
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Already a member? ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showLoginPage,
                    child: const Text(
                      "Sign in now",
                      style: TextStyle(
                          color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}