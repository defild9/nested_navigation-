class Email {
  final String subject;
  final String? sender;
  final String body;
  final String date;
  final String? senderImage;
  final String? recipient;

  Email(
      {required this.subject,
      this.sender,
      required this.body,
      required this.date,
      this.senderImage,
      this.recipient});
}
