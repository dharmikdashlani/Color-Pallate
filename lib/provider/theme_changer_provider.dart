import 'package:flutter/material.dart';

import '../modal/theme_changer_modal.dart';

class ThemeController extends ChangeNotifier {
  ThemeChanger t = ThemeChanger(isDark: false);

  setDark() {
    t.isDark = !t.isDark;
    notifyListeners();
  }
}
