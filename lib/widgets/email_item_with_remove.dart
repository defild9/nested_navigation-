import 'package:flutter/material.dart';
import 'package:nested_navigation/data/email_client.dart';
import 'package:nested_navigation/data/email_model.dart';
import 'package:provider/provider.dart';

class EmailItemWithRemoveFromArchive extends StatefulWidget {
  final Email email;
  const EmailItemWithRemoveFromArchive({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailItemWithRemoveFromArchive> createState() => _EmailItemWithRemoveFromArchiveState();
}

class _EmailItemWithRemoveFromArchiveState extends State<EmailItemWithRemoveFromArchive> {
  bool _isStared = false;

  @override
  Widget build(BuildContext context) {
    final archiveEmails = Provider.of<EmailClient>(context);
    return Dismissible(
      key: Key(widget.email.subject),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete),
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
        archiveEmails.removeFromArchive(widget.email);
        archiveEmails.addToEmails(widget.email);
      },
    );
  }
}

class EmailItemWithRemoveFromSaved extends StatefulWidget {
  final Email email;
  const EmailItemWithRemoveFromSaved({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailItemWithRemoveFromSaved> createState() => _EmailItemWithRemoveFromSavedState();
}

class _EmailItemWithRemoveFromSavedState extends State<EmailItemWithRemoveFromSaved> {
  bool _isStared = false;

  @override
  Widget build(BuildContext context) {
    final archiveEmails = Provider.of<EmailClient>(context);
    return Dismissible(
      key: Key(widget.email.subject),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete),
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
        archiveEmails.removeFromSaved(widget.email);
        archiveEmails.addToEmails(widget.email);
      },
    );
  }
}

class EmailItemWithRemoveFromSent extends StatefulWidget {
  final Email email;
  const EmailItemWithRemoveFromSent({Key? key, required this.email}) : super(key: key);

  @override
  State<EmailItemWithRemoveFromSent> createState() => _EmailItemWithRemoveFromSentState();
}

class _EmailItemWithRemoveFromSentState extends State<EmailItemWithRemoveFromSent> {
  bool _isStared = false;

  @override
  Widget build(BuildContext context) {
    final archiveEmails = Provider.of<EmailClient>(context);
    return Dismissible(
      key: Key(widget.email.subject),
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: const Icon(Icons.delete),
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
        archiveEmails.removeFromSentEmails(widget.email);
      },
    );
  }
}





