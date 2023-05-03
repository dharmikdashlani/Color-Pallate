import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:provider/provider.dart';

import '../../Globals/random_globals.dart';
import '../../provider/theme_changer_provider.dart';

class RandomColor extends StatefulWidget {
  const RandomColor({Key? key}) : super(key: key);

  @override
  State<RandomColor> createState() => _RandomColorState();
}

class _RandomColorState extends State<RandomColor> {
  int _numberOfColors = 5;
  List<Color> _palette = [];

  void _generatePalette() {
    setState(() {
      _palette = ColorGenerator().generatePalette(_numberOfColors);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Number of colors: $_numberOfColors'),
            Slider(
              activeColor:
                  (Provider.of<ThemeController>(context, listen: true).t.isDark)
                      ? const Color(0xff146C94)
                      : const Color(0xff19A7CE),
              value: _numberOfColors.toDouble(),
              min: 1,
              max: 100,
              onChanged: (value) {
                setState(() {
                  _numberOfColors = value.toInt();
                });
              },
            ),
            SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      (Provider.of<ThemeController>(context, listen: true)
                              .t
                              .isDark)
                          ? const MaterialStatePropertyAll(
                              Color(0xff146C94),
                            )
                          : const MaterialStatePropertyAll(
                              Color(0xff19A7CE),
                            ),
                ),
                onPressed: _generatePalette,
                child: const Text(
                  'Generate Palette',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 3,
                children: _palette.map((color) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: (Provider.of<ThemeController>(
                                        context,
                                        listen: true)
                                    .t
                                    .isDark)
                                ? Color(0xff146C94)
                                : Color(0xff19A7CE),
                            title: const Text('Pick a color'),
                            content: SingleChildScrollView(
                              child: ColorPicker(
                                pickerColor: color,
                                onColorChanged: (newColor) {
                                  setState(() {
                                    _palette[_palette.indexOf(color)] =
                                        newColor;
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: Container(
                      color: color,
                      margin: const EdgeInsets.all(4),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
