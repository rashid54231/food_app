import 'package:flutter/material.dart';
import 'create_screen.dart';
import 'read_screen.dart';
import 'update_screen.dart';
import 'delete_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Widget buildButton(BuildContext context, String title, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => screen),
          );
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
        ),
        child: Text(title),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            buildButton(context, "Create", const CreateScreen()),
            buildButton(context, "Read", const ReadScreen()),
            buildButton(context, "Update", const UpdateScreen()),
            buildButton(context, "Delete", const DeleteScreen()),
          ],
        ),
      ),
    );
  }
}
