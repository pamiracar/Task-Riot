import 'dart:math';

import 'package:flutter/material.dart';
import 'package:task_riot/services/shared_prefences_service.dart';
import 'package:task_riot/services/todo.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _textController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final SharedPrefencesService _prefencesService = SharedPrefencesService();

  final List<Map<String, String>> quotes = [
    {
      "quote": "The only way to do great work is to love what you do.",
      "author": "Steve Jobs",
    },
    {"quote": "I think, therefore I am.", "author": "René Descartes"},
    {
      "quote":
          "Whether you think you can or you think you can't, you're right.",
      "author": "Henry Ford",
    },
    {
      "quote":
          "Success usually comes to those who are too busy to be looking for it.",
      "author": "Henry David Thoreau",
    },
    {
      "quote": "Don't watch the clock; do what it does. Keep going.",
      "author": "Sam Levenson",
    },
    {
      "quote": "Believe you can and you're halfway there.",
      "author": "Theodore Roosevelt",
    },
    {
      "quote": "Act as if what you do makes a difference. It does.",
      "author": "William James",
    },
    {
      "quote":
          "What you get by achieving your goals is not as important as what you become by achieving your goals.",
      "author": "Zig Ziglar",
    },
    {
      "quote": "You miss 100% of the shots you don't take.",
      "author": "Wayne Gretzky",
    },
    {
      "quote": "The harder the conflict, the greater the triumph.",
      "author": "George Washington",
    },
    {
      "quote": "Don't be afraid to give up the good to go for the great.",
      "author": "John D. Rockefeller",
    },
    {
      "quote":
          "I have not failed. I've just found 10,000 ways that won't work.",
      "author": "Thomas Edison",
    },
    {
      "quote": "It always seems impossible until it's done.",
      "author": "Nelson Mandela",
    },
    {
      "quote": "In the middle of difficulty lies opportunity.",
      "author": "Albert Einstein",
    },
    {
      "quote":
          "Your time is limited, so don't waste it living someone else's life.",
      "author": "Steve Jobs",
    },
    {
      "quote": "Keep your eyes on the stars, and your feet on the ground.",
      "author": "Theodore Roosevelt",
    },
    {
      "quote": "Don't limit your challenges, challenge your limits.",
      "author": "Jerry Dunn",
    },
    {
      "quote":
          "Success is not final, failure is not fatal: It is the courage to continue that counts.",
      "author": "Winston Churchill",
    },
    {
      "quote":
          "The future belongs to those who believe in the beauty of their dreams.",
      "author": "Eleanor Roosevelt",
    },
    {
      "quote": "Do what you can, with what you have, where you are.",
      "author": "Theodore Roosevelt",
    },
  ];

  late Map<String, String> selectedQuote;

  @override
  void initState() {
    super.initState();
    _pickRandomQuote();
  }

  void _pickRandomQuote() {
    final random = Random();
    selectedQuote = quotes[random.nextInt(quotes.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add New Task")),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: addButton,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                elevation: 0,
                textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                backgroundColor: Color(0xFF0D1B2A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.blueGrey),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: const Text(
                  "Add",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _titleController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please write something';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      label: Text(
                        "Title",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    controller: _textController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please write something";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.blueGrey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      label: Text(
                        "Text",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    maxLines: 3,
                    maxLength: 80,
                  ),
                ],
              ),
            ),

            SizedBox(height: 140),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '"${selectedQuote["quote"]}"',
                  style: const TextStyle(fontSize: 14, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  '- ${selectedQuote["author"]}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 14,
                    color: Colors.blueGrey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void addButton() async {
    if (_formKey.currentState!.validate()) {
      Todo task = Todo(title: _titleController.text, text: _titleController.text);
      await _prefencesService.saveData(task.title, _textController.text);
      Navigator.pop(context);
      setState(() {

      });

    }
  }
}
