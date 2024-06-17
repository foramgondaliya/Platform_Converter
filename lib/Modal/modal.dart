class Contact {
  String name;
  String contact;
  String? imagePath;
  // final String contactName;
  // final String contactNumber;
  final DateTime timestamp;

  Contact({
    required this.name,
    required this.contact,
    this.imagePath,
    // required this.contactName,
    // required this.contactNumber,
    required this.timestamp,
  });
}
