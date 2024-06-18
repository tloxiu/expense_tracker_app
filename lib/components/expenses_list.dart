import 'package:expense_tracker_app/components/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expenses_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(
      {super.key, required this.expenses, required this.onDeleteExpense});

  final List<ExpensesModel> expenses;
  final void Function(ExpensesModel expense) onDeleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          color: Colors.red[600],
        ),
        onDismissed: (direction) {
          onDeleteExpense(
            expenses[index],
          );
        },
        key: ValueKey(expenses[index]),
        child: ExpensesItem(expenses[index]),
      ),
    );
  }
}
