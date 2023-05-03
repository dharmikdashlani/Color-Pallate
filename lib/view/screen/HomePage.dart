import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import '../../provider/theme_changer_provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PaletteGenerator? _paletteGenerator;
  List<Color>? _paletteColors;

  // Future<void> _getImageAndGeneratePalette() async {
  //   final picker = ImagePicker();
  //   final pickedFile = await picker.getImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     final bytes = await pickedFile.readAsBytes();
  //     final image = await decodeImageFromList(bytes);
  //     setState(() {
  //       _paletteGenerator = PaletteGenerator.fromImage(image) as PaletteGenerator?;
  //       _paletteColors = _paletteGenerator?.colors.toList();
  //     });
  //   }
  // }

  Future<void> _getImageAndGeneratePalette() async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final bytes = await pickedFile.readAsBytes();
      final image = await decodeImageFromList(bytes);
      final generator = await PaletteGenerator.fromImage(image);
      setState(() {
        _paletteGenerator = generator;
        _paletteColors = _paletteGenerator!.colors.toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ignore: prefer_const_constructors
              Center(
                child: const Text(
                  "Pick Image and Find Color",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50,
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
                  onPressed: _getImageAndGeneratePalette,
                  child: const Text(
                    'Generate Palette',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              if (_paletteGenerator != null)
                Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: const Text(
                        "Primary Color",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PaletteColorCard(
                          color: _paletteGenerator!.dominantColor!.color),
                    ),
                    Center(
                      child: const Text(
                        "Other Color",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    ..._paletteColors!.map((color) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: PaletteColorCard(
                            color: color,
                          ),
                        )),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class PaletteColorCard extends StatelessWidget {
  final Color? color;

  const PaletteColorCard({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
