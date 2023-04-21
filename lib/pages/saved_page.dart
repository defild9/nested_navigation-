import 'package:flutter/material.dart';
import 'package:nested_navigation/widgets/email_item_with_remove.dart';
import 'package:provider/provider.dart';

import '../data/email_client.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailClient = Provider.of<EmailClient>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved'),
      ),
      body: emailClient.savedEmails.isEmpty
          ? const Center(
              child: Text('No archived emails.'),
            )
          : ListView.builder(
              itemCount: emailClient.savedEmails.length,
              itemBuilder: (context, index) {
                return EmailItemWithRemoveFromSaved(
                    email: emailClient.savedEmails[index]);
              },
            ),
    );
  }
}
