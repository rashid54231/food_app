import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ReadScreen extends StatefulWidget {
  const ReadScreen({super.key});

  @override
  State<ReadScreen> createState() => _ReadScreenState();
}

class _ReadScreenState extends State<ReadScreen> {
  final supabase = Supabase.instance.client;
  List<Map<String, dynamic>> foodList = [];

  @override
  void initState() {
    super.initState();
    fetchFood();
  }

  Future<void> fetchFood() async {
    try {
      final response = await supabase
          .from('food')
          .select(); // ← just .select() – no .execute()

      setState(() {
        foodList = List<Map<String, dynamic>>.from(response);
      });
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching food: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Read Foods"),
      ),
      body: foodList.isEmpty
          ? const Center(child: Text("No food added yet"))
          : ListView.builder(
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          final food = foodList[index];
          return ListTile(
            title: Text(food['name']?.toString() ?? 'Unnamed'),
            // Optional: show more fields
            // subtitle: Text(food['description'] ?? ''),
          );
        },
      ),
    );
  }
}