import 'package:flutter/material.dart';
import 'package:nested_navigation/data/email_client.dart';
import 'package:nested_navigation/pages/archive_page.dart';
import 'package:nested_navigation/pages/compose_email_page.dart';
import 'package:nested_navigation/pages/saved_page.dart';
import 'package:nested_navigation/pages/sent_page.dart';
import 'package:nested_navigation/widgets/email_item.dart';
import 'package:provider/provider.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final emailClient = Provider.of<EmailClient>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: emailClient.emails.length,
              itemBuilder: (BuildContext context, int index) {
                return EmailItem(email: emailClient.emails[index]);
              },
            ),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.archive),
              title: const Text('Archive'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ArchivePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.star),
              title: const Text('Saved'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SavedPage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.send),
              title: const Text('Sent'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SentPage()));
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: Row(
          children: const [
            Icon(Icons.edit),
            SizedBox(width: 8.0),
            Text("Compose")
          ],
        ),
        onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ComposeEmailPage(context))),
      ),
    );
  }
}
