import 'package:expense_tracker_app/components/expenses_item.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expenses_model.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<ExpensesModel> expenses;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => ExpensesItem(expenses[index]),
    );
  }
}
