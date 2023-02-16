import 'package:flutter/material.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () => null,
        icon: Icon(
          Icons.notifications,
          size: 20,
          color: Colors.white,
        ));
  }
}
