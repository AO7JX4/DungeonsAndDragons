import 'package:flutter/material.dart';

class SigningButton extends StatefulWidget {
  const SigningButton({super.key, required this.action, required this.buttonText});
  final VoidCallback action;
  final String buttonText;

  @override
  State<SigningButton> createState() => _SigningButtonState();
}

class _SigningButtonState extends State<SigningButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: GestureDetector(
        onTap: widget.action,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.brown[900]!,
                  Colors.brown[800]!,
                  Colors.brown[900]!,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
              child: Text(
            widget.buttonText,
            style: const TextStyle(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );
  }
}
