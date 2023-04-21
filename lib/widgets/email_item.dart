import 'package:flutter/material.dart';
import 'package:nested_navigation/data/email_client.dart';
import 'package:nested_navigation/data/email_model.dart';
import 'package:provider/provider.dart';

class EmailItem extends StatefulWidget {
  final Email email;

  const EmailItem({Key? key, required this.email}) : super(key: key);

  @override
  _EmailItemState createState() => _EmailItemState();
}

class _EmailItemState extends State<EmailItem> {
  bool _isStared = false;

  @override
  Widget build(BuildContext context) {
    final archiveEmails = Provider.of<EmailClient>(context);
    return Dismissible(
      key: Key(widget.email.subject),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.green,
        child: const Icon(Icons.archive),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/email', arguments: widget.email);
        },
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(widget.email.senderImage ?? ''),
          ),
          title: Text(widget.email.subject),
          subtitle: Text(widget.email.sender ?? 'NoName'),
          trailing: IconButton(
            icon: Icon(
              _isStared ? Icons.star : Icons.star_border,
              color: _isStared ? Colors.amber : null,
            ),
            onPressed: () {
              setState(() {
                _isStared = !_isStared;
                if (_isStared) {
                  archiveEmails.addToSaved(widget.email);
                } else {
                  archiveEmails.removeFromSaved(widget.email);
                }
              });
            },
          ),
        ),
      ),
      onDismissed: (direction) {
        archiveEmails.addToArchive(widget.email);
        archiveEmails.removeFromEmails(widget.email);
      },
    );
  }
}


