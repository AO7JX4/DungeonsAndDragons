import 'package:dungeons_and_dragons/pages/register_page.dart';
import 'package:flutter/material.dart';

import 'login_page.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;

  void toggleScreens(){
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage(showRegisterPage: toggleScreens); // Removed 'const'
    } else {
      return RegisterPage(showLoginPage: toggleScreens); // Removed 'const'
    }
  }
}