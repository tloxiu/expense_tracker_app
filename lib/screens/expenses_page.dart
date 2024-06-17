import 'package:expense_tracker_app/components/new_expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/models/expenses_model.dart';
import 'package:expense_tracker_app/components/expenses_list.dart';

class ExpensesPage extends StatefulWidget {
  const ExpensesPage({super.key});

  @override
  State<ExpensesPage> createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<ExpensesPage> {
  
  void saveExpense(ExpensesModel expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello Roksana!"),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (ctx) => NewExpense(
                  onAddExpense: saveExpense,
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.add),
            ),
          ),
        ],
      ),
      body: ExpensesList(expenses: registeredExpenses),
    );
  }
}
