import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nested_navigation/data/email_client.dart';
import 'package:nested_navigation/data/email_model.dart';
import 'package:provider/provider.dart';

class ComposeEmailPage extends StatefulWidget {
  final BuildContext context;

  const ComposeEmailPage(this.context, {Key? key}) : super(key: key);

  @override
  State<ComposeEmailPage> createState() => _ComposeEmailPageState();
}

class _ComposeEmailPageState extends State<ComposeEmailPage> {
  final TextEditingController _toController = TextEditingController();
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  void _sendEmail() {
    final newEmail = Email(
      subject: _subjectController.text,
      recipient: _toController.text,
      date: DateFormat('yyyy-MM-dd H:m').format(DateTime.now()).toString(),
      sender: 'me',
      body: _bodyController.text,
    );

    final emailClient = Provider.of<EmailClient>(widget.context, listen: false);
    emailClient.addToSentEmails(newEmail);

    Navigator.pop(widget.context, newEmail);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Compose'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _toController,
              decoration: const InputDecoration(
                labelText: 'To',
              ),
            ),
            const SizedBox(height: 8.0),
            TextField(
              controller: _subjectController,
              decoration: const InputDecoration(
                labelText: 'Subject',
              ),
            ),
            const SizedBox(height: 8.0),
            Expanded(
              child: TextField(
                controller: _bodyController,
                maxLines: null,
                expands: true,
                decoration: const InputDecoration(
                  labelText: 'Body',
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: _sendEmail,
              child: const Text('Send'),
            ),
          ],
        ),
      ),
    );
  }
}
