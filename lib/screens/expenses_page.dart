import 'package:expense_tracker_app/components/chart.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/components/new_expense.dart';
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
    final expenseIndex = registeredExpenses.indexOf(expense);

    setState(() {
      registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: const Color.fromARGB(255, 122, 178, 178),
        action: SnackBarAction(
            label: 'Undo',
            onPressed: () {
              setState(
                () {
                  registeredExpenses.insert(expenseIndex, expense);
                },
              );
            }),
        duration: const Duration(seconds: 3),
        content: const Text(
          'Expense deleted',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Hello Roksana!",
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                useSafeArea: true,
                backgroundColor: Theme.of(context).brightness == Brightness.dark
                    ? const Color.fromARGB(255, 26, 33, 48)
                    : const Color.fromARGB(255, 238, 238, 238),
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
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Chart(expenses: registeredExpenses),
          ),
          Expanded(
            flex: 2,
            child: registeredExpenses.isNotEmpty
                ? ExpensesList(
                    expenses: registeredExpenses,
                    onDeleteExpense: deleteExpense,
                  )
                : const Center(
                    child: Text('No expenses found!'),
                  ),
          ),
        ],
      ),
    );
  }
}
