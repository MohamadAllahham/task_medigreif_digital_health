import 'package:flutter/material.dart';

class AdviserAvatar extends StatelessWidget {
  final double? avatarRadius;
  const AdviserAvatar({super.key, this.avatarRadius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: avatarRadius,
      backgroundImage: NetworkImage(
          'https://thumbs.dreamstime.com/b/happy-girl-red-glasses-books-speech-bubble-creative-teacher-giving-advice-flat-vector-illustration-turquoise-background-103337225.jpg'),
    );
  }
}
