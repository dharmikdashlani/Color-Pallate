import 'dart:math';
import 'package:flutter/material.dart';

class ColorGenerator {
  List<Color> generatePalette(int numberOfColors) {
    List<Color> palette = [];
    Random random = Random();
    for (int i = 0; i < numberOfColors; i++) {
      Color color = Color.fromARGB(
        255,
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
      );
      palette.add(color);
    }
    return palette;
  }
}
