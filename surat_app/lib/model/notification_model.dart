class MyNotification {
  final String title;
  final String message;

  MyNotification({required this.title, required this.message});

  factory MyNotification.fromFirestore(Map<String, dynamic> json) {
    return MyNotification(
      title: json['title'],
      message: json['message'],
    );
  }
}
