import 'dart:async';
import 'dart:ui';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../generated/assets.dart';

class ShaderImage extends StatefulWidget {
  const ShaderImage({super.key, required this.imageSrc, required this.modColor});
  final String imageSrc;
  final Color modColor;

  @override
  State<ShaderImage> createState() => _ShaderImageState();
}

class _ShaderImageState extends State<ShaderImage> {
  FragmentShader? shader;
  ui.Image? image;
  ui.Image? finalImage;

  Future<void> loadShader() async {
    final imageData = await rootBundle.load(widget.imageSrc);
    final loadedImage = await decodeImageFromList(imageData.buffer.asUint8List());
    final program = await FragmentProgram.fromAsset(Assets.shadersChangeImageColorShader);
    final loadedShader = program.fragmentShader();

    image = loadedImage;
    shader = loadedShader;

    if (image != null && shader != null) {
      _createImageWithShader(image!);
    }
  }

  Future<void> _createImageWithShader(ui.Image sourceImage) async {
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);

    final size = Size(sourceImage.width.toDouble(), sourceImage.height.toDouble());
    if (shader != null) {
      shader!.setImageSampler(0, sourceImage);
      shader!.setFloat(0, size.width);
      shader!.setFloat(1, size.height);
      shader!.setFloat(2, widget.modColor.red.toDouble() / 255);
      shader!.setFloat(3, widget.modColor.green.toDouble() / 255);
      shader!.setFloat(4, widget.modColor.blue.toDouble() / 255);

      final paint = Paint()..shader = shader;
      canvas.drawRect(Offset.zero & size, paint);

      final picture = recorder.endRecording();
      final ui.Image generatedImage = await picture.toImage(sourceImage.width, sourceImage.height);


      if (mounted) {
        setState(() {
          finalImage = generatedImage;
        });
      }
    }
  }

  @override
  void initState() {
    super.initState();
    loadShader();
  }

  @override
  void didUpdateWidget(covariant ShaderImage oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.imageSrc != widget.imageSrc) { //If image asset changed
      loadShader();
    }
    if (oldWidget.modColor != widget.modColor && image != null) { //If image color changed
      _createImageWithShader(image!);
    }
  }

  @override
  void dispose() {
    // Optional: Perform cleanup here if needed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (finalImage == null) {
      return const Center(child: CircularProgressIndicator());
    } else {
      return RawImage(image: finalImage);
    }
  }
}
