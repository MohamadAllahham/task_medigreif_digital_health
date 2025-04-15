import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/common/app_box.dart';
import 'package:task_medigreif_digital_health/common/app_text_field.dart';
import 'package:task_medigreif_digital_health/common/form_selection.dart';
import 'package:task_medigreif_digital_health/common/mood_list_widget.dart';
import 'package:task_medigreif_digital_health/common/title_content_box.dart';
import 'package:task_medigreif_digital_health/common/ui_models/selector_model.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';
import 'package:task_medigreif_digital_health/screens/create_mood_screen/providers.dart';

class CreateMoodStepOne extends ConsumerWidget {
  const CreateMoodStepOne({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final controller = ref.watch(highlightOfTheDayControllerProvider);
    final theme = Theme.of(context);

    final List<SelectorModel> feelings = [
      SelectorModel(
        iconData: Icons.bolt,
        title: localizations.energetic,
      ),
      SelectorModel(
        iconData: Icons.emoji_emotions,
        title: localizations.euphoric,
      ),
      SelectorModel(
        iconData: Icons.bedtime,
        title: localizations.tired,
      ),
      SelectorModel(
        iconData: Icons.sentiment_satisfied,
        title: localizations.content,
      ),
      SelectorModel(
        iconData: Icons.wb_sunny,
        title: localizations.cheerful,
      ),
      SelectorModel(
        iconData: Icons.add_reaction,
        title: localizations.optimistic,
      ),
      SelectorModel(
        iconData: Icons.emoji_events,
        title: localizations.joyful,
      ),
      SelectorModel(
        iconData: Icons.rocket_launch,
        title: localizations.motivated,
      ),
      SelectorModel(
        iconData: Icons.favorite,
        title: localizations.grateful,
      ),
      SelectorModel(
        iconData: Icons.self_improvement,
        title: localizations.calm,
      ),
    ];

    final List<SelectorModel> sleeping = [
      SelectorModel(
        iconData: Icons.hotel,
        title: localizations.good,
      ),
      SelectorModel(
        iconData: Icons.remove_circle_outline,
        title: localizations.soSo,
      ),
      SelectorModel(
        iconData: Icons.mood_bad,
        title: localizations.bad,
      ),
    ];

    final List<SelectorModel> achievements = [
      SelectorModel(
        iconData: Icons.groups,
        title: localizations.meetingFriends,
      ),
      SelectorModel(
        iconData: Icons.bedtime,
        title: localizations.sleeping,
      ),
      SelectorModel(
        iconData: Icons.fitness_center,
        title: localizations.sport,
      ),
      SelectorModel(
        iconData: Icons.airplanemode_active,
        title: localizations.traveling,
      ),
      SelectorModel(
        iconData: Icons.palette,
        title: localizations.hobby,
      ),
      SelectorModel(
        iconData: Icons.spa,
        title: localizations.chilling,
      ),
      SelectorModel(
        iconData: Icons.cleaning_services,
        title: localizations.housework,
      ),
    ];

    return Column(
      children: [
        Text(
          localizations.mood,
          style: theme.textTheme.titleLarge?.copyWith(fontSize: 20.0),
        ),
        const SizedBox(height: 16.0),
        AppBox(
          child: MoodListWidget(
            onMoodTapped: (mood) =>
                {ref.read(moodTypeProvider.notifier).state = mood},
          ),
        ),
        const SizedBox(height: 16.0),
        TitleContentBox(
          title: localizations.howDidYouFeel,
          child: FormSelection(
            selectors: feelings,
            provider: feelingsProvider,
          ),
        ),
        const SizedBox(height: 16.0),
        TitleContentBox(
          title: localizations.howWasYourSleep,
          child: FormSelection(
            selectors: sleeping,
            provider: sleepingProvider,
          ),
        ),
        const SizedBox(height: 16.0),
        TitleContentBox(
          title: localizations.whatDidYouDo,
          child: FormSelection(
            selectors: achievements,
            provider: achievementsProvider,
          ),
        ),
        const SizedBox(height: 16.0),
        TitleContentBox(
          title: localizations.highlightOfTheDay,
          child: AppTextField(
            controller: controller,
            lines: 1,
            hintText: localizations.startWriting,
          ),
        ),
      ],
    );
  }
}
