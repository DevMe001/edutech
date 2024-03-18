import 'dart:ui';
import 'dart:ui' as ui;

import 'package:camera/camera.dart';
import 'package:elerningapp/controller/corrdinates_translator.txt';
import 'package:flutter/material.dart';
import 'package:google_mlkit_object_detection/google_mlkit_object_detection.dart';


class ObjectDetectorPainter extends CustomPainter {
  ObjectDetectorPainter(
    this._objects,
    this.imageSize,
    this.rotation,
    this.cameraLensDirection,
  );

  final List<DetectedObject> _objects;
  final Size imageSize;
  final InputImageRotation rotation;
  final CameraLensDirection cameraLensDirection;

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3.0
      ..color = Colors.lightGreenAccent;

    final Paint background = Paint()..color = const Color(0x99000000);

    for (final DetectedObject detectedObject in _objects) {
      final ParagraphBuilder builder = ParagraphBuilder(
        ParagraphStyle(
            textAlign: TextAlign.center,
            fontSize: 24,
            textDirection: TextDirection.ltr),
      );
      builder.pushStyle(
          ui.TextStyle(color: Colors.lightGreenAccent, background: background));
      if (detectedObject.labels.isNotEmpty) {
        final label = detectedObject.labels
            .reduce((a, b) => a.confidence > b.confidence ? a : b);

        String confidenceString = (label.confidence * 100).toStringAsFixed(2);
        
        builder.addText('${label.text} $confidenceString % \n');
      }
      builder.pop();

      final left = translateX(
        detectedObject.boundingBox.left,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final top = translateY(
        detectedObject.boundingBox.top,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final right = translateX(
        detectedObject.boundingBox.right,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );
      final bottom = translateY(
        detectedObject.boundingBox.bottom,
        size,
        imageSize,
        rotation,
        cameraLensDirection,
      );

      // Calculate the center of the bounding box
      final centerX = (left + right) / 2;
      final centerY = (top + bottom) / 2;

        // Build and layout the paragraph
        final paragraph = builder.build()
          ..layout(
            ParagraphConstraints(width: (right - left).abs()),
          );


        // Position the paragraph at the center of the bounding box
        canvas.drawParagraph(
          paragraph,
          Offset(
            centerX - paragraph.width / 2,
            centerY - paragraph.height / 2,
          ),
        );

      canvas.drawRect(
        Rect.fromLTRB(left, top, right, bottom),
        paint,
      );

      // canvas.drawParagraph(
      //   builder.build()
      //     ..layout(ParagraphConstraints(
      //       width: (right - left).abs(),
      //     )),
      //   Offset(
      //       Platform.isAndroid &&
      //               cameraLensDirection == CameraLensDirection.front
      //           ? right
      //           : left,
      //       top),
      // );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
