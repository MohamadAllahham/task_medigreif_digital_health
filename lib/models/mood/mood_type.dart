import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';
import 'package:task_medigreif_digital_health/generated/assets.gen.dart';
import 'package:task_medigreif_digital_health/theme.dart';

enum MoodType {
  sad,
  angry,
  okay,
  good,
  happy;

  SvgPicture getSvgIcon({double? height, double? width}) {
    switch (this) {
      case MoodType.happy:
        return Assets.moods.moodHappy.svg(height: height, width: width);
      case MoodType.angry:
        return Assets.moods.moodAngry.svg(height: height, width: width);
      case MoodType.good:
        return Assets.moods.moodGood.svg(height: height, width: width);
      case MoodType.okay:
        return Assets.moods.moodOkay.svg(height: height, width: width);
      case MoodType.sad:
        return Assets.moods.moodSad.svg(height: height, width: width);
    }
  }

  Color getMoodColor() {
    switch (this) {
      case MoodType.happy:
        return happyMoodColor;
      case MoodType.angry:
        return angryMoodColor;
      case MoodType.good:
        return goodMoodColor;
      case MoodType.okay:
        return okayMoodColor;
      case MoodType.sad:
        return sadMoodColor;
    }
  }

  String getTitle(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    switch (this) {
      case MoodType.happy:
        return localizations.happyMood;
      case MoodType.angry:
        return localizations.angryMood;
      case MoodType.good:
        return localizations.goodMood;
      case MoodType.okay:
        return localizations.okayMood;
      case MoodType.sad:
        return localizations.sadMood;
    }
  }
}
