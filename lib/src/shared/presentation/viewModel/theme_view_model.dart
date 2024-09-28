

import 'package:cleancode/src/core/storage/storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



class DarkModeNotifier extends StateNotifier<bool> {

  late SharedPreferences prefs;

  Future _init() async {

    prefs=await SharedPreferences.getInstance();
    var darkMode = AppSharedPrefs(prefs).getIsDarkTheme();
    state = darkMode;
  }

  DarkModeNotifier() : super(false) {
    _init();
  }
  void toggle() {
    state = !state;
    AppSharedPrefs(prefs).setDarkTheme(state);
  }
}

final darkModeProvider = StateNotifierProvider<DarkModeNotifier, bool>(
      (ref) => DarkModeNotifier(),
);