import 'package:flutter/material.dart';

class InformationCollectorButton extends StatefulWidget {
  const InformationCollectorButton({super.key, required this.textEditingController, required this.hintText, required this.hideText});
  final TextEditingController textEditingController;
  final String hintText;
  final bool hideText;

  @override
  State<InformationCollectorButton> createState() => _InformationCollectorButtonState();
}

class _InformationCollectorButtonState extends State<InformationCollectorButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.brown[700]!,
              Colors.brown[600]!,
              Colors.brown[700]!,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          border: Border.all(color: Colors.amber, width: 2),
          borderRadius: const BorderRadius.all(Radius.elliptical(10, 20)),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: TextField(
            obscureText: widget.hideText,
            controller: widget.textEditingController,
            style: const TextStyle(color: Colors.amber),
            decoration: InputDecoration(
              counterStyle: const TextStyle(color: Colors.amber),
              hintStyle: const TextStyle(color: Colors.amber),
              border: InputBorder.none,
              hintText: widget.hintText,
            ),
          ),
        ),
      ),
    );
  }
}