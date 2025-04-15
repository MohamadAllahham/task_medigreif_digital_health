import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_medigreif_digital_health/common/adviser_avatar.dart';
import 'package:task_medigreif_digital_health/common/app_text_field.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';
import 'package:task_medigreif_digital_health/screens/create_mood_screen/providers.dart';

class CreateMoodStepTwo extends ConsumerWidget {
  const CreateMoodStepTwo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(noteControllerProvider);
    final localizations = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 64.0),
          child: Text(
            localizations.addComment,
            style: theme.textTheme.titleLarge?.copyWith(fontSize: 20.0),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 16.0),
        AppTextField(
          lines: 8,
          controller: controller,
          shadowEffect: true,
          hintText: localizations.startWriting,
        ),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.lerp(Colors.white, theme.colorScheme.secondary, 0.3)!,
                Color.lerp(Colors.white, theme.colorScheme.secondary, 0.6)!,
                theme.colorScheme.secondary
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: const BorderRadius.all(
              Radius.circular(16.0),
            ),
          ),
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const AdviserAvatar(avatarRadius: 24.0),
              const SizedBox(width: 12.0),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      localizations.tellMeHowYouFelt,
                      style:
                          theme.textTheme.titleLarge?.copyWith(fontSize: 16.0),
                    ),
                    Text(
                      localizations.commentHint,
                      style:
                      theme.textTheme.labelLarge,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
