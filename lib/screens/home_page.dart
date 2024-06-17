import 'package:expense_tracker_app/screens/expenses_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Positioned(
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: const Color.fromARGB(34, 187, 52, 208),
                    width: 350,
                    height: 410,
                  ),
                ),
              ),
              Positioned(
                width: 430,
                top: 30,
                right: 5,
                child: Image.asset('assets/home_page_logo.png'),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 315,
            width: 350,
            child: Text(
              'Get more from your Money',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w900, fontSize: 60),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 180),
            child: Container(
              padding: const EdgeInsets.only(left: 25),
              alignment: Alignment.centerLeft,
              width: 200,
              height: 70,
              decoration: BoxDecoration(
                color: Colors.yellow[400],
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExpensesPage(),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 30,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
