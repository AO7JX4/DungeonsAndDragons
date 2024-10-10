import 'package:flutter/material.dart';

import '../custom_widgets/potion_loading_indicator.dart';

 abstract class LoadableWidget extends StatefulWidget {
  const LoadableWidget({super.key});

  void showLoadingPotion(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'Loading',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.7), // Optional: Background color with opacity
          body: const Center(
            child: PotionLoadingIndicator(),
          ),
        );
      },
    );
  }


  void hideLoadingPotion(BuildContext context){
    Navigator.of(context).pop();
  }

  @override
  State<LoadableWidget> createState() => _LoadableWidgetState();
}

class _LoadableWidgetState extends State<LoadableWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

