import 'package:dungeons_and_dragons/custom_widgets/information_collector_button.dart';
import 'package:dungeons_and_dragons/custom_widgets/signing_button.dart';
import 'package:dungeons_and_dragons/mixins/m_loadable.dart';
import 'package:dungeons_and_dragons/pages/character/choose_character_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class LoginPage extends StatefulWidget  {
  const LoginPage({super.key, required this.showRegisterPage});
  final VoidCallback showRegisterPage;

  @override
  State<LoginPage> createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage> with MLoadable {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();


  //Sign in the user to firebase
  Future signIn() async {
    // Show loading indicator
    showLoadingPotion(context);

    try {
      // Sign in with Firebase
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      // If sign-in is successful, navigate to the next page
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return const CharacterPage();
      }));
    } on FirebaseAuthException catch (e) {
      hideLoadingPotion(context);// Remove loading indicator

      // Show error message if sign-in fails
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Sign In Failed'),
            content: Text(e.message ?? 'Unknown error'),
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
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

              //Sign in button
              SigningButton(action: signIn,buttonText: "Sign In",),

              const SizedBox(
                height: 10,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not a member? ",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      " Register now",
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
