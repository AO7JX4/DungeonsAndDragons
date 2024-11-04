import 'package:flutter/material.dart';
import '../custom_widgets/potion_loading_indicator.dart';


//TEST COMMENT
mixin class MLoadable  {

  void showLoadingPotion(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: 'Loading',
      pageBuilder: (context, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: Colors.black.withOpacity(0.7),
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
}


