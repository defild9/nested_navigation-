import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:nested_navigation/data/email_model.dart';

class EmailClient extends ChangeNotifier {
  final List<Email> _archiveEmails = [];
  final List<Email> _savedEmails = [];
  final List<Email> _sentEmails = [];
  final List<Email> emails = [
    Email(
      subject: 'New task in classroom',
      sender: 'Google classroom',
      body: 'You have a new task',
      date: DateFormat('yyyy-MM-dd H:m').format(DateTime.now()).toString(),
      senderImage:
      'https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1',
    ),
    Email(
      subject: 'Some email ',
      sender: 'Bob Shader',
      body: 'You a cool man!',
      date: DateFormat('yyyy-MM-dd H:m').format(DateTime.now()).toString(),
      senderImage:
      'https://img.freepik.com/free-photo/portrait-handsome-man-with-dark-hairstyle-bristle-toothy-smile-dressed-white-sweatshirt-feels-very-glad-poses-indoor-pleased-european-guy-being-good-mood-smiles-positively-emotions-concept_273609-61405.jpg',
    ),
  ];


  void addToArchive(Email email) {
    _archiveEmails.add(email);
    notifyListeners();
  }

  void removeFromArchive(Email email) {
    _archiveEmails.remove(email);
    notifyListeners();
  }

  void addToSaved(Email email) {
    _savedEmails.add(email);
    notifyListeners();
  }

  void removeFromSaved(Email email) {
    _savedEmails.remove(email);
    notifyListeners();
  }

  void addToSentEmails(Email email) {
    _sentEmails.add(email);
    notifyListeners();
  }

  void removeFromSentEmails(Email email) {
    _sentEmails.remove(email);
    notifyListeners();
  }

  void addToEmails(Email email){
    emails.add(email);
    notifyListeners();
  }

  void removeFromEmails(Email email){
    emails.remove(email);
    notifyListeners();
  }

  List<Email> get archiveEmails => _archiveEmails;

  List<Email> get sentEmails => _sentEmails;

  List<Email> get savedEmails => _savedEmails;
}
