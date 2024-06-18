import 'package:expense_tracker_app/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Light theme
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Color.fromARGB(255, 122, 178, 178),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 238, 238, 238),
          foregroundColor: Color.fromARGB(255, 26, 33, 48),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 26, 33, 48),
            fontSize: 20,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              headlineMedium: GoogleFonts.poppins(
                fontWeight: FontWeight.w900,
                fontSize: 60,
                color: const Color.fromARGB(255, 26, 33, 48),
              ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      home: const HomePage(),
    );
  }
}
