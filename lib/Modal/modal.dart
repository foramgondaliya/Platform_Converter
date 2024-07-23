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

final List<ChatItem> chatItems = [
  ChatItem('Tony Stark', 'Flutter is great', '12:28 pm',
      'assets/images/tony_stark.jpg'),
  ChatItem('Captain America', 'Hey There!', '1:25 am',
      'assets/images/captain_america.jpg'),
  ChatItem('Thor', 'Done', '4:23 pm', 'assets/images/thor.jpg'),
  ChatItem(
      'Thanos', 'Ready for fight?', '12:28 pm', 'assets/images/thanos.jpg'),
  ChatItem('Hulk', 'I threw my phone because I am angry...', '12:28 pm',
      'assets/images/hulk.jpg'),
  ChatItem(
      'Dr. Strange', 'It’s magic.', 'Today', 'assets/images/dr_strange.jpg'),
  ChatItem('Spider Man', 'You are my friend.', 'Today',
      'assets/images/spider_man.jpg'),
  ChatItem('Ant Man', 'You are mine fellow.', 'Tomorrow',
      'assets/images/ant_man.jpg'),
  ChatItem(
      'Hawkeye', 'Keep your eyes open...', 'Now', 'assets/images/hawkeye.jpg'),
  ChatItem('Black Widow', '...', 'Now', 'assets/images/black_widow.jpg'),
];

class ChatItem {
  final String name;
  final String message;
  final String time;
  final String imagePath;

  ChatItem(this.name, this.message, this.time, this.imagePath);
}
