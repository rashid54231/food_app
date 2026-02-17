import 'package:flutter/material.dart';

class DeleteScreen extends StatefulWidget {
  const DeleteScreen({super.key});

  @override
  State<DeleteScreen> createState() => _DeleteScreenState();
}

class _DeleteScreenState extends State<DeleteScreen> {
  final TextEditingController _deleteController = TextEditingController();

  void _deleteFood() {
    String nameToDelete = _deleteController.text;

    if (nameToDelete.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Deleted: $nameToDelete")),
      );

      _deleteController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delete Food"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _deleteController,
              decoration: const InputDecoration(
                labelText: "Food Name to Delete",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _deleteFood,
              child: const Text("Delete"),
            ),
          ],
        ),
      ),
    );
  }
}
