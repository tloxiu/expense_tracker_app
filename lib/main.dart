import 'package:expense_tracker_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';

extension CustomTextTheme on TextTheme {
  TextStyle get headlineLargeLarge => GoogleFonts.poppins(
        fontWeight: FontWeight.w900,
        fontSize: 60,
      );
}

void main() {
  // Locking app with portraitUp orientation for responsiveness 
  WidgetsFlutterBinding.ensureInitialized(); 
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]).then((function) {
    runApp(
      const MainApp(),
    );
  });
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
        brightness: Brightness.light,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 26, 33, 48),
            fontSize: 20,
          ),
          actionsIconTheme: IconThemeData(
            color: Color.fromARGB(255, 26, 33, 48),
          ),
        ),
      ),
      darkTheme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 26, 33, 48),
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 26, 33, 48),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 238, 238, 238),
            fontSize: 20,
          ),
          actionsIconTheme: IconThemeData(
            color: Color.fromARGB(255, 238, 238, 238),
          ),
        ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
