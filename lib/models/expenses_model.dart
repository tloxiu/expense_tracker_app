import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final formatter = DateFormat.yMd();

enum Category { food, work, leisure, travel }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.leisure: Icons.movie,
  Category.travel: Icons.flight_takeoff
};

const uuid = Uuid();



class ExpensesModel {
  ExpensesModel(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String formatDate() {
    return formatter.format(date);
  }
}



// Class for the chart and the 'category list'
class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  // Filtering by category, allExpenses that were filtered by '.where' will be assign to expenses, so we can have different lists with each category.
  ExpenseBucket.forCategory(List<ExpensesModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<ExpensesModel> expenses;

  double calculateTotalExpenses() {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}



// List of all expenses
final List<ExpensesModel> registeredExpenses = [
  ExpensesModel(
      title: 'Flutter Course',
      amount: 39.99,
      date: DateTime.now(),
      category: Category.work),
  ExpensesModel(
      title: 'Ticket to USA',
      amount: 2.678,
      date: DateTime.now(),
      category: Category.travel),
];
