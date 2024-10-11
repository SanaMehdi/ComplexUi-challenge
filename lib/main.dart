import 'package:flutter/material.dart';

// Reusable AppBar Widget
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: Colors.orange[800],
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

// Reusable Button Section Widget
class ButtonSection extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  const ButtonSection({super.key, required this.onPressed, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.orange[800],
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      ),
      child: Text(buttonText),
    );
  }
}

// Reusable TextField Widget
class TextFieldSection extends StatelessWidget {
  final TextEditingController controller;
  final String label;

  const TextFieldSection({super.key, required this.controller, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}

// Stateful Container Widget (for handling color change and counter increment)
class StatefulContainer extends StatefulWidget {
  const StatefulContainer({super.key});

  @override
  _StatefulContainerState createState() => _StatefulContainerState();
}

class _StatefulContainerState extends State<StatefulContainer> {
  Color _color = Colors.blue;
  int _counter = 0;

  void _changeColor() {
    setState(() {
      _color = _color == Colors.blue ? Colors.green : Colors.blue;
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: _changeColor,
          child: Container(
            height: 150,
            width: double.infinity,
            color: _color,
            child: Center(
              child: Text(
                'Tap to Change Color',
                style: const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ButtonSection(
          onPressed: _incrementCounter,
          buttonText: 'Counter: $_counter',
        ),
      ],
    );
  }
}

// Main Complex UI Page
class ComplexUIPage extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  ComplexUIPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Complex UI with Reusable Widgets"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            // Text Input Section
            TextFieldSection(
              controller: _textController,
              label: 'Enter your name',
            ),
            const SizedBox(height: 20),
            // Button Section
            Center(
              child: ButtonSection(
                onPressed: () {
                  print('Hello ${_textController.text}');
                },
                buttonText: 'Press Me',
              ),
            ),
            const SizedBox(height: 20),
            // Stateful Container Section
            const StatefulContainer(),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Refactored Complex UI',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ComplexUIPage(),
    );
  }
}
