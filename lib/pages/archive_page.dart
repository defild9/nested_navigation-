import 'package:flutter/material.dart';
import 'package:nested_navigation/data/email_client.dart';
import 'package:nested_navigation/widgets/email_item_with_remove.dart';
import 'package:provider/provider.dart';

class ArchivePage extends StatelessWidget {
  const ArchivePage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailClient = Provider.of<EmailClient>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Archive'),
      ),
      body: emailClient.archiveEmails.isEmpty
          ? const Center(
              child: Text('No archived emails.'),
            )
          : ListView.builder(
              itemCount: emailClient.archiveEmails.length,
              itemBuilder: (context, index) {
                return EmailItemWithRemoveFromArchive(email: emailClient.archiveEmails[index]);
              },
            ),
    );
  }
}
