import 'package:flutter/material.dart';
import 'package:nested_navigation/data/email_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Email email = ModalRoute.of(context)!.settings.arguments as Email;

    return Scaffold(
      appBar: AppBar(
        title: Text(email.subject),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              email.subject,
              style:
              const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16.0),
            Text(
              'From: ${email.sender}',
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'To: me',
              style: TextStyle(fontSize: 16.0),
            ),
            const Divider(),
            Text(
              email.body,
              style: const TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),

    );
  }
}
