import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expenses_model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final ExpensesModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 122, 178, 178),
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(
              expense.title,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                  style: const TextStyle(color: Colors.white),
                ),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                      color: Colors.white,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      expense.formatDate(),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
