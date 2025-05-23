import 'package:flutter/material.dart';

class TripExpenseScreen extends StatefulWidget {
  final String tripName;
  const TripExpenseScreen({super.key, required this.tripName});

  @override
  State<TripExpenseScreen> createState() => _TripExpenseScreenState();
}

class _TripExpenseScreenState extends State<TripExpenseScreen> {
  final List<Map<String, dynamic>> _expenses = [];
  final TextEditingController _descController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _addExpense() {
    final desc = _descController.text.trim();
    final amount = double.tryParse(_amountController.text.trim());
    if (desc.isNotEmpty && amount != null) {
      setState(() {
        _expenses.add({"desc": desc, "amount": amount});
        _descController.clear();
        _amountController.clear();
      });
    }
  }

  double get _total => _expenses.fold(0.0, (sum, item) => sum + item['amount']);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${widget.tripName} Expenses')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _descController,
                  decoration: const InputDecoration(labelText: 'Description'),
                ),
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(labelText: 'Amount'),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _addExpense,
                  child: const Text('Add Expense'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _expenses.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_expenses[index]['desc']),
                trailing: Text('₹${_expenses[index]['amount'].toStringAsFixed(2)}'),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total: ₹${_total.toStringAsFixed(2)}',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}

