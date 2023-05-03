// // // import 'package:flutter/material.dart';
// // // import 'package:flutter_clipboard/flutter_clipboard.dart';
// // // import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// // // import 'package:palette_generator/palette_generator.dart';
// // //
// // // class ColorPickerScreen extends StatefulWidget {
// // //   const ColorPickerScreen({Key? key}) : super(key: key);
// // //
// // //   @override
// // //   _ColorPickerScreenState createState() => _ColorPickerScreenState();
// // // }
// // //
// // // class _ColorPickerScreenState extends State<ColorPickerScreen> {
// // //   late Color _currentColor;
// // //   PaletteGenerator? _paletteGenerator;
// // //   late List<Color> _paletteColors;
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _currentColor = Colors.white;
// // //     _paletteColors = [_currentColor];
// // //   }
// // //
// // //   Future<void> _generatePalette() async {
// // //     _paletteGenerator = await PaletteGenerator.fromColor(_currentColor);
// // //     _paletteColors = _paletteGenerator!.colors.toList();
// // //     setState(() {});
// // //   }
// // //
// // //   Future<void> _copyColorToClipboard(Color color) async {
// // //     final hexCode = color.value.toRadixString(16).toUpperCase().substring(2);
// // //     await FlutterClipboard.copy('#$hexCode');
// // //
// // //     ScaffoldMessenger.of(context).showSnackBar(
// // //       SnackBar(
// // //         content: Text('Copied #$hexCode to clipboard'),
// // //         duration: const Duration(seconds: 1),
// // //       ),
// // //     );
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: const Text('Color Picker'),
// // //       ),
// // //       body: Padding(
// // //         padding: const EdgeInsets.all(16.0),
// // //         child: Column(
// // //           crossAxisAlignment: CrossAxisAlignment.start,
// // //           children: [
// // //             Center(
// // //               child: SizedBox(
// // //                 height: 200,
// // //                 width: 200,
// // //                 child: GestureDetector(
// // //                   onTap: () {
// // //                     showDialog(
// // //                       context: context,
// // //                       builder: (_) => AlertDialog(
// // //                         title: const Text('Pick a color'),
// // //                         content: SingleChildScrollView(
// // //                           child: ColorPicker(
// // //                             pickerColor: _currentColor,
// // //                             onColorChanged: (color) {
// // //                               setState(() => _currentColor = color);
// // //                             },
// // //                             showLabel: true,
// // //                             pickerAreaHeightPercent: 0.8,
// // //                           ),
// // //                         ),
// // //                         actions: [
// // //                           TextButton(
// // //                             onPressed: () {
// // //                               Navigator.of(context).pop();
// // //                               _generatePalette();
// // //                             },
// // //                             child: const Text('Generate Palette'),
// // //                           ),
// // //                         ],
// // //                       ),
// // //                     );
// // //                   },
// // //                   child: Container(
// // //                     decoration: BoxDecoration(
// // //                       color: _currentColor,
// // //                       borderRadius: BorderRadius.circular(100),
// // //                     ),
// // //                   ),
// // //                 ),
// // //               ),
// // //             ),
// // //             const SizedBox(height: 32),
// // //             Text(
// // //               'Palette',
// // //               style: Theme.of(context).textTheme.headline6,
// // //             ),
// // //             const SizedBox(height: 8),
// // //             Wrap(
// // //               spacing: 8,
// // //               runSpacing: 8,
// // //               children: _paletteColors
// // //                   .map((color) => GestureDetector(
// // //                         onTap: () => _copyColorToClipboard(color),
// // //                         child: Container(
// // //                           width: 32,
// // //                           height: 32,
// // //                           decoration: BoxDecoration(
// // //                             color: color,
// // //                             borderRadius: BorderRadius.circular(4),
// // //                           ),
// // //                         ),
// // //                       ))
// // //                   .toList(),
// // //             ),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:flutter_colorpicker/flutter_colorpicker.dart';
// // import 'package:flutter_clipboard/flutter_clipboard.dart';
// //
// // Color selectedColor = Colors.white;
// //
// // void pickColor(BuildContext context) {
// //   showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: const Text('Pick a color'),
// //         content: SingleChildScrollView(
// //           child: ColorPicker(
// //             pickerColor: selectedColor,
// //             onColorChanged: (color) {
// //               setState(() => selectedColor = color);
// //             },
// //             showLabel: true,
// //             pickerAreaHeightPercent: 0.8,
// //           ),
// //         ),
// //         actions: <Widget>[
// //           TextButton(
// //             child: const Text('COPY'),
// //             onPressed: () {
// //               FlutterClipboard.copy(selectedColor.toString());
// //               Navigator.of(context).pop();
// //             },
// //           ),
// //           TextButton(
// //             child: const Text('CANCEL'),
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }
// // ElevatedButton(
// // onPressed: () => pickColor(context),
// // child: const Text('Pick a color'),
// // ),
// // Container(
// // width: 100,
// // height: 100,
// // color: selectedColor,
// // ),
// //
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';
//
// class SaveColor extends StatefulWidget {
//   @override
//   _SaveColorState createState() => _SaveColorState();
// }
//
// class _SaveColorState extends State<SaveColor> {
//   Color selectedColor = Colors.red; // default selected color
//
//   void changeColor(Color color) {
//     setState(() => selectedColor = color);
//   }
//
//   void copyToClipboard() {
//     final hexString = '#${selectedColor.value.toRadixString(16).substring(2)}';
//     Clipboard.setData(ClipboardData(text: hexString));
//     final snackBar = SnackBar(content: Text('Copied to clipboard: $hexString'));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Color Picker'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.copy),
//             onPressed: copyToClipboard,
//           ),
//         ],
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ColorPicker(
//               pickerColor: selectedColor,
//               onColorChanged: changeColor,
//               showLabel: true,
//               pickerAreaHeightPercent: 0.8,
//             ),
//             SizedBox(height: 20),
//             Container(
//               width: 100,
//               height: 100,
//               color: selectedColor,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:math';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// import 'package:flutter_clipboard/flutter_clipboard.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;
import 'dart:io';

// import 'package:flutter_clipboard/flutter_clipboard.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_changer_provider.dart';

class SaveColor extends StatefulWidget {
  @override
  _SaveColorState createState() => _SaveColorState();
}

class _SaveColorState extends State<SaveColor> {
  Color _color = Colors.white;

  void _generateRandomColor() {
    setState(() {
      final Random random = Random();
      _color = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1.0,
      );
    });
  }

  void _copyToClipboard() {
    FlutterClipboard.copy(_color.toString()).then((value) =>
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Copied to clipboard'))));
  }

  void _saveColor() async {
    final directory = await getApplicationDocumentsDirectory();
    final file = File('${directory.path}/color.png');
    final image = img.Image(100, 100, channels: img.Channels.rgb);

    final color = _color;
    final pixelData = color.value.toRadixString(16).padLeft(8, '0');
    final red = int.parse(pixelData.substring(2, 4), radix: 16);
    final green = int.parse(pixelData.substring(4, 6), radix: 16);
    final blue = int.parse(pixelData.substring(6, 8), radix: 16);

    img.fill(image, img.getColor(red, green, blue));
    final pngBytes = img.encodePng(image);

    await file.writeAsBytes(pngBytes);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Color saved to gallery')));
    await GallerySaver.saveImage(file.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: _generateRandomColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Container(
                      height: 250,
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: (Provider.of<ThemeController>(context,
                                        listen: true)
                                    .t
                                    .isDark)
                                ? const Color(0xff146C94)
                                : const Color(0xff19A7CE),
                            // blurStyle: BlurStyle.solid,
                            spreadRadius: 7,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        color: _color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Text(
                  "Tap To More Colors",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Copy Color Code"),
                  IconButton(
                    icon: Icon(Icons.copy),
                    onPressed: _copyToClipboard,
                  ),
                  Text("Download Color"),
                  IconButton(
                    icon: Icon(Icons.file_download),
                    onPressed: _saveColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
