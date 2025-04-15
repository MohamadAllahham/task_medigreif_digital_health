import 'package:flutter/material.dart';
import 'package:task_medigreif_digital_health/common/mood_widget.dart';
import 'package:task_medigreif_digital_health/models/mood/mood_type.dart';

class MoodListWidget extends StatelessWidget {
  final void Function(MoodType mood)? onMoodTapped;
  const MoodListWidget({super.key, this.onMoodTapped});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: MoodType.values
          .map(
            (mood) => MoodWidget(
              mood: mood,
              onTap: () => onMoodTapped?.call(mood),
            ),
          )
          .toList(),
    );
  }
}
