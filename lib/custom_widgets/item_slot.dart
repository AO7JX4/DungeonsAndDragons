import 'package:flutter/material.dart';
import '../generated/assets.dart';

class ItemSlot extends StatelessWidget {
  const ItemSlot({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.red,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                Assets.assetsItemSlotHero,
                fit: BoxFit.fill,
              ),


              LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: FractionallySizedBox(
                        heightFactor: 0.2,
                        widthFactor: 0.38,
                        child: Container(color: Colors.blue),
                      ),
                    ),
                  );
                },
              ),


              LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: Offset(0, -constraints.maxHeight * 0.15),
                        child: FractionallySizedBox(
                          heightFactor: 0.2,
                          widthFactor: 0.38,
                          child: Container(color: Colors.orange),
                        ),
                      ),
                    ),
                  );
                },
              ),


              LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Transform.translate(
                        offset: Offset(0, constraints.maxHeight * 0.07),
                        child: FractionallySizedBox(
                          heightFactor: 0.2,
                          widthFactor: 0.38,
                          child: Container(color: Colors.blue),
                        ),
                      ),
                    ),
                  );
                },
              ),


              LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Transform.translate(
                        offset: Offset(0, constraints.maxHeight * 0.07),
                        child: FractionallySizedBox(
                          heightFactor: 0.2,
                          widthFactor: 0.38,
                          child: Container(color: Colors.blue),
                        ),
                      ),
                    ),
                  );
                },
              ),


              LayoutBuilder(
                builder: (context, constraints) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Transform.translate(
                        offset: Offset(0, constraints.maxHeight * 0.29),
                        child: FractionallySizedBox(
                          heightFactor: 0.2,
                          widthFactor: 0.38,
                          child: Container(color: Colors.orange),
                        ),
                      ),
                    ),
                  );
                },
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: FractionallySizedBox(
                    heightFactor: 0.2,
                    widthFactor: 0.38,
                    child: Container(color: Colors.orange),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
