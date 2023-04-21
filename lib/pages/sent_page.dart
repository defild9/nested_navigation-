import 'package:flutter/material.dart';
import 'package:nested_navigation/widgets/email_item_with_remove.dart';
import 'package:provider/provider.dart';

import '../data/email_client.dart';
class SentPage extends StatelessWidget {
  const SentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailClient = Provider.of<EmailClient>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sent'),
      ),
      body: emailClient.sentEmails.isEmpty
          ? const Center(
        child: Text('No archived emails.'),
      )
          : ListView.builder(
        itemCount: emailClient.sentEmails.length,
        itemBuilder: (context, index) {
          return EmailItemWithRemoveFromSent(email: emailClient.sentEmails[index]);
        },
      ),
    );
  }
}
