import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  const Chatbot({Key? key}) : super(key: key);

  @override
  _ChatbotState createState() => _ChatbotState();
}

class _ChatbotState extends State<Chatbot> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chatbot'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Display "Hello, World!" when the button is pressed
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Hello, World!'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          },
          child: Text('Say Hello'),
        ),
      ),
    );
  }
}
