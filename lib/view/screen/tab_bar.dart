import 'dart:math';

import 'package:color_pallate/view/screen/random_color.dart';
import 'package:color_pallate/view/screen/save_color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar.dart';
import 'package:rolling_bottom_bar/rolling_bottom_bar_item.dart';

import '../../provider/theme_changer_provider.dart';
import 'setting.dart';
import 'HomePage.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({Key? key}) : super(key: key);

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // elevation: 2,
        centerTitle: true,
        title: const Text('Color Pallate'),
        backgroundColor:
        (Provider.of<ThemeController>(context, listen: true).t.isDark)
            ? Color(0xff146C94)
            : Color(0xff19A7CE),
      ),
      body: PageView(
        controller: _controller,
        children:  <Widget>[
          HomePage(),
          SaveColor(),
          RandomColor(),
          Setting(),
        ],
      ),
      extendBody: true,
      bottomNavigationBar: RollingBottomBar(
        controller: _controller,
        items: const [
          RollingBottomBarItem(Icons.color_lens_outlined, label: 'Colors'),
          RollingBottomBarItem(Icons.save_alt, label: 'Save Color'),
          RollingBottomBarItem(Icons.radio_button_checked,
              label: 'Random'),
          RollingBottomBarItem(Icons.settings, label: 'Setting'),
        ],
        activeItemColor:
            (Provider.of<ThemeController>(context, listen: true).t.isDark)
                ? Color(0xff146C94)
                : Color(0xff19A7CE),
        enableIconRotation: true,
        onTap: (index) {
          _controller.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOut,
          );
        },
      ),
    );
  }
}
