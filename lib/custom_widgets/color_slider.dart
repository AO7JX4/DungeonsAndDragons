import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ColorSlider extends ConsumerWidget {
  final double colorValueR;
  final double colorValueG;
  final double colorValueB;
  final void Function(double) onRChanged;
  final void Function(double) onGChanged;
  final void Function(double) onBChanged;

  const ColorSlider({
    super.key,
    required this.colorValueR,
    required this.colorValueG,
    required this.colorValueB,
    required this.onRChanged,
    required this.onGChanged,
    required this.onBChanged,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        const Expanded(
          flex: 10,
          child: Column(
            children: [
              Expanded(
                flex: 33,
                child: Center(
                  child: Text("R"),
                ),
              ),
              Expanded(
                flex: 33,
                child: Center(
                  child: Text("G"),
                ),
              ),
              Expanded(
                flex: 33,
                child: Center(
                  child: Text("B"),
                ),
              ),
            ],
          ),
        ),

        Expanded(
          flex: 90,
          child: Column(
          children: [
            Expanded(
              flex: 33,
              child: Slider(
                value: colorValueR,
                min: 0.0,
                max: 255.0,
                divisions: 255,
                onChanged: onRChanged,
              ),
            ),
            Expanded(
              flex: 33,
              child: Slider(
                value: colorValueG,
                min: 0.0,
                max: 255.0,
                divisions: 255,
                onChanged: onGChanged,
              ),
            ),
            Expanded(
              flex: 33,
              child: Slider(
                value: colorValueB,
                min: 0.0,
                max: 255.0,
                divisions: 255,
                onChanged: onBChanged,
              ),
            ),
          ],
                ),
        ),]
    );
  }
}

