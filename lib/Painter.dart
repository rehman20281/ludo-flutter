import 'dart:math';

import 'package:flutter/material.dart';

class LudoBoardPainter extends CustomPainter {
  final double strokeWidth;

  LudoBoardPainter({required this.strokeWidth});

  List<int> boardColor = [];

  @override
  void paint(Canvas canvas, Size size) {
    double radius = min(size.width, size.height) / 2 - strokeWidth;

    // Draw squares
    double squareSize = radius / 6;
    Paint squarePaint = Paint()..style = PaintingStyle.fill;
    double x = -42;
    double y = -190;
    int index = 0;
    for (int row = 0; row < 15; row++) {
      for (int col = 0; col < 15; col++) {
        if ((index >= 0 && index <= 5) ||
            (index >= 15 && index <= 20) ||
            (index >= 30 && index <= 35) ||
            (index >= 45 && index <= 50) ||
            (index >= 60 && index <= 65) ||
            (index >= 75 && index <= 80) ||
            (index == 91 || (index >= 106 && index <= 110)) ||
            (index == 111)) {
          squarePaint = Paint()..style = PaintingStyle.fill;

          if ((index >= 0 && index <= 5) ||
              (index == (15 * (row))) ||
              (index >= 76 && index <= 80) ||
              (index == 20 || index == 35 || index == 50 || index == 65)) {
            squarePaint.color = Color(0xFFF006622);
          } else {
            squarePaint.color = Colors.lightGreen;
          }
        } else if ((index >= 9 && index <= 14) ||
            (index >= 24 && index <= 29) ||
            (index >= 39 && index <= 44) ||
            (index >= 54 && index <= 59) ||
            (index >= 69 && index <= 74) ||
            (index >= 84 && index <= 89) ||
            (index == 22 ||
                index == 23 ||
                index == 37 ||
                index == 52 ||
                index == 67 ||
                index == 82 ||
                index == 87 ||
                index == 97)) {
          squarePaint = Paint()..style = PaintingStyle.fill;
          squarePaint.color = Colors.yellowAccent;
        } else if ((index >= 135 && index <= 140) ||
            (index >= 150 && index <= 155) ||
            (index >= 165 && index <= 170) ||
            (index >= 180 && index <= 185) ||
            (index >= 195 && index <= 200) ||
            (index >= 210 && index <= 215) ||
            ((index >= 114 && index <= 118) || index == 133 || index == 113)) {
          squarePaint = Paint()..style = PaintingStyle.fill;
          squarePaint.color = Colors.red;
        } else if ((index >= 144 && index <= 149) ||
            (index >= 159 && index <= 164) ||
            (index >= 174 && index <= 179) ||
            (index >= 189 && index <= 194) ||
            (index >= 204 && index <= 209) ||
            (index >= 219 && index <= 224) ||
            (index == 142 ||
                index == 157 ||
                index == 172 ||
                index == 187 ||
                index == 202 ||
                index == 201 ||
                index == 127)) {
          squarePaint = Paint()..style = PaintingStyle.fill;
          squarePaint.color = Colors.blue;
        } else if (index == 103 ||
            index == 121 ||
            index == 21 ||
            index == 203) {
          squarePaint = Paint()..style = PaintingStyle.fill;

          squarePaint.color = Colors.grey;
        } else {
          squarePaint = Paint()..style = PaintingStyle.stroke;
          squarePaint.strokeWidth = 1.5;
        }
        if (index == 96 ||
            index == 98 ||
            index == 128 ||
            index == 126 ||
            index == 111 ||
            index == 127 ||
            index == 113 ||
            index == 112 ||
            index == 97) {
          var path = Path();
          path.moveTo(148, -2.5);
          path.lineTo(188, -40);
          path.lineTo(188, 36);
          path.close();
          canvas.drawPath(path, Paint()..color = Colors.red);
          canvas.save(); // save the current canvas state

          canvas.translate(
              150, -154); // move the origin to the center of the canvas
          canvas.rotate(190 * pi / 10); // rotate the canvas by 190 degrees
          canvas.translate(-148,
              -150); // move the origin back to the top-left corner of the canvas
          canvas.drawPath(path, Paint()..color = Colors.green);
          canvas.restore();

          path = Path();
          path.moveTo(110, -40);
          path.lineTo(188, -40);
          path.lineTo(150, 0);
          canvas.drawPath(path, Paint()..color = Colors.yellow);

          canvas.save(); // save the current canvas state

          canvas.translate(
              150, -154); // move the origin to the center of the canvas
          canvas.rotate(190 * pi / 10); // rotate the canvas by 190 degrees
          canvas.translate(-150,
              -150); // move the origin back to the top-left corner of the canvas
          path = Path();
          path.moveTo(110, -40);
          path.lineTo(188, -38);
          path.lineTo(150, -2);
          canvas.drawPath(path, Paint()..color = Colors.blue);
          canvas.restore();
        } else {
          canvas.drawRect(
              Rect.fromLTWH(x, y, squareSize, squareSize), squarePaint);
        }
        //
        TextPainter textPainter = TextPainter(
          text: TextSpan(
            text: '${index}',
            style: TextStyle(
              color: Colors.black,
              fontSize: 10,
            ),
          ),
          textAlign: TextAlign.center,
          textDirection: TextDirection.ltr,
        );
        textPainter.layout(minWidth: 0, maxWidth: squareSize);
        Offset textOffset = Offset(x, y);
        textPainter.paint(canvas, textOffset);
        index++;

        x += 25.5;
        // Add your text
      }
      y += 25;
      x = -42;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
