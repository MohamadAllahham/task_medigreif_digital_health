import 'package:flutter/material.dart';
import 'package:task_medigreif_digital_health/models/mood/mood_type.dart';

class MoodWidget extends StatelessWidget {
  final MoodType mood;
  final VoidCallback? onTap;

  const MoodWidget({
    super.key,
    required this.mood,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: mood.getMoodColor(),
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        child: mood.getSvgIcon(),
      ),
    );
  }
}
