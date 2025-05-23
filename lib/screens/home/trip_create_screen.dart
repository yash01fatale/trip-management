import 'package:flutter/material.dart';

class TripCreateScreen extends StatefulWidget {
  const TripCreateScreen({super.key});

  @override
  State<TripCreateScreen> createState() => _TripCreateScreenState();
}

class _TripCreateScreenState extends State<TripCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  DateTime? _startDate;
  DateTime? _endDate;

  void _submitTrip() {
    // Store trip in Firestore (to be implemented)
    Navigator.pop(context);
  }

  Future<void> _pickDateRange() async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        _startDate = picked.start;
        _endDate = picked.end;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Trip')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(labelText: 'Trip Title'),
            ),
            TextField(
              controller: _locationController,
              decoration: const InputDecoration(labelText: 'Location'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _pickDateRange,
              child: const Text('Select Date Range'),
            ),
            if (_startDate != null && _endDate != null)
              Text('From ${_startDate!.toLocal()} to ${_endDate!.toLocal()}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _submitTrip,
              child: const Text('Create Trip'),
            ),
          ],
        ),
      ),
    );
  }
}
