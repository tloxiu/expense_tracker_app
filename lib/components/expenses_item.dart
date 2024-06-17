import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expenses_model.dart';

class ExpensesItem extends StatelessWidget {
  const ExpensesItem(this.expense, {super.key});

  final ExpensesModel expense;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(5),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Text(expense.title),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${expense.amount.toStringAsFixed(2)}',
                ),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(width: 10),
                    Text(expense.formatDate()),
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
