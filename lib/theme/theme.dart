import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = ChangeNotifierProvider<AppDynamicTheme>((ref) {
  return AppDynamicTheme();
});

class AppDynamicTheme extends ChangeNotifier {
  AppDynamicTheme();

  static bool isDark = true;

  toggle() {
    print('toggle theme to ${isDark ? 'dark' : 'light'}');
    isDark = !isDark;
    notifyListeners();
  }

  ThemeData getTheme() {
    return isDark ? darkTheme : lightTheme;
  }

  /// DARK
  static final ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.grey,
    backgroundColor: Colors.black,
    accentColor: Colors.green,
    cardColor: Colors.blueGrey[900],
    primaryTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.blueGrey[200],
        decorationColor: Colors.blueGrey[50],
      ),

      /// Default to large screen
      /// AdaptableText handles fontsize for other screen sizes
      ///
      /// Titles (Extremely Large text)
      headline1: TextStyle(fontSize: 48, color: Colors.white), // title
      /// Subtitles (Very Large Text)
      headline2: TextStyle(fontSize: 36, color: Colors.white), // description
      /// Standard text for small screen
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ), // normal
      /// Standard text for large screen
      bodyText2: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ), // normal
    ),
    bottomAppBarColor: Colors.black,
    iconTheme: IconThemeData(color: Colors.blueGrey[200]),
    brightness: Brightness.dark,
  );

  /// LIGHT
  static final ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blueGrey,
    backgroundColor: Colors.white.withOpacity(0.35),
    appBarTheme: AppBarTheme(
        color: Colors.white,
        shadowColor: Colors.grey,
        brightness: Brightness.light,
        elevation: 50),
    accentColor: Colors.blueAccent,
    cardColor: Colors.blueGrey[200],
    primaryTextTheme: TextTheme(
      button: TextStyle(
        color: Colors.blueGrey,
        decorationColor: Colors.blueGrey[300],
      ),

      /// Default to large screen
      /// AdaptableText handles fontsize for other screen sizes
      ///
      /// Titles (Extremely Large text)
      headline1: TextStyle(fontSize: 48, color: Colors.black), // description
      /// Subtitles (Very Large Text)
      headline2: TextStyle(fontSize: 36, color: Colors.black), // title
      bodyText1: TextStyle(
        fontSize: 20,
        color: Colors.white,
      ), // normal
      /// Default text (normal body text)
      bodyText2: TextStyle(
        fontSize: 18,
        color: Colors.black,
      ), // normal
    ),
    bottomAppBarColor: Colors.blueGrey[900],
    iconTheme: IconThemeData(color: Colors.blueGrey),
    brightness: Brightness.light,
  );
}
