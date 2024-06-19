import 'package:flutter/material.dart';
import 'package:expense_tracker_app/components/chart_bar.dart';
import 'package:expense_tracker_app/models/expenses_model.dart';



class Chart extends StatelessWidget {
  const Chart({super.key, required this.expenses});

  final List<ExpensesModel> expenses;

  List<ExpenseBucket> get buckets {
    return [
      ExpenseBucket.forCategory(expenses, Category.food),
      ExpenseBucket.forCategory(expenses, Category.leisure),
      ExpenseBucket.forCategory(expenses, Category.travel),
      ExpenseBucket.forCategory(expenses, Category.work),
    ];
  }

  double get maxTotalExpense {
    double maxTotalExpense = 0;

    // Checking the biggest bucket category list
    for (final bucket in buckets) {
      if (bucket.calculateTotalExpenses() > maxTotalExpense) {
        maxTotalExpense = bucket.calculateTotalExpenses();
      }
    }

    return maxTotalExpense;
  }



  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 8,
      ),
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Creating a bucket for every bucket in buckets getter (list)
                for (final bucket in buckets) // or .map
                  ChartBar(
                    fill: bucket.calculateTotalExpenses() == 0
                        ? 0
                        : bucket.calculateTotalExpenses() / maxTotalExpense,
                  )
              ],
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: buckets
                .map( // or for in
                  (bucket) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: Icon(
                        categoryIcons[bucket.category],
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
