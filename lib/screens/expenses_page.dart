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
  
  void addExpense(ExpensesModel expense) {
    setState(() {
      registeredExpenses.add(expense);
    });
  }

  void deleteExpense(ExpensesModel expense) {
    setState(() {
      registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 238, 238, 238),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 238, 238, 238),
        title: const Text(
          "Hello Roksana!",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 26, 33, 48),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: const Color.fromARGB(255, 238, 238, 238),
                isScrollControlled: true,
                context: context,
                builder: (ctx) => NewExpense(
                  onAddExpense: addExpense,
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.add,
                color: Color.fromARGB(255, 26, 33, 48),
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: ExpensesList(
        expenses: registeredExpenses,
        onDeleteExpense: deleteExpense,
      ),
    );
  }
}
