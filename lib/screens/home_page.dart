import 'package:expense_tracker_app/main.dart';
import 'package:expense_tracker_app/screens/expenses_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    // ignore: unused_local_variable
    final headlineLargeLarge =
        Theme.of(context).textTheme.headlineLargeLarge.copyWith(
              color: brightness == Brightness.dark
                  ? const Color.fromARGB(255, 238, 238, 238)
                  : const Color.fromARGB(255, 26, 33, 48),
            );

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Image.asset('assets/home_page_logo.png'),
          ),
          SizedBox(
            height: 315,
            width: 350,
            child: Text(
              'Get more from your Money',
              style: Theme.of(context).textTheme.headlineLargeLarge,
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
                color: const Color.fromARGB(255, 122, 178, 178),
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
                  color: Color.fromARGB(255, 238, 238, 238),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
