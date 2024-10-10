import 'package:dungeons_and_dragons/abstract/loadable_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/information_collector_button.dart';
import '../custom_widgets/signing_button.dart';
import 'choose_character_page.dart';

class RegisterPage extends LoadableWidget {
  const RegisterPage({super.key, required this.showLoginPage});
  final VoidCallback showLoginPage;

  @override
  State<RegisterPage> createState() => _RegisterPageState();

}



class _RegisterPageState extends State<RegisterPage> {
  //Register user
  Future signUp() async {
    //Check if passwords are same
    if (isPasswordConfirmed()) {
      // Show loading indicator while creating the account
     widget.showLoadingPotion(context);

      try {
        // Try creating the account
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        //If success then navigate
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) {
          return const CharacterPage();
        }));
      } on FirebaseAuthException catch (e) {
        widget.hideLoadingPotion(context); // Delete loading icon

        // When error occurs
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
      //If passwords are not correct
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Passwords do not match'),
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

  bool isPasswordConfirmed() {
    return _passwordController.text.trim() ==
        _confirmPasswordController.text.trim();
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
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
              const SizedBox(
                height: 10,
              ),

              //Email button
              InformationCollectorButton(
                textEditingController: _emailController,
                hintText: "Email",
                hideText: false,
              ),
              const SizedBox(
                height: 10,
              ),

              //Password button
              InformationCollectorButton(
                textEditingController: _passwordController,
                hintText: "Password",
                hideText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              //Password confirm button
              InformationCollectorButton(
                textEditingController: _confirmPasswordController,
                hintText: "Confirm password",
                hideText: true,
              ),
              const SizedBox(
                height: 10,
              ),

              //Sign up button
              SigningButton(
                action: signUp,
                buttonText: "Sign Up",
              ),

              const SizedBox(
                height: 10,
              ),

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
