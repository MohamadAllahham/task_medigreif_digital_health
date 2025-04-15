import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:task_medigreif_digital_health/common/mood_list_widget.dart';
import 'package:task_medigreif_digital_health/generated/app_localizations.dart';
import 'package:task_medigreif_digital_health/models/user/user.dart';
import 'package:task_medigreif_digital_health/services/data_storage_service.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  Future<User?> _getUser() async {
    return await GetIt.I.get<DataStorageService>().getUser();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return FutureBuilder<User?>(
      future: _getUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('localizations.error'));
        } else {
          final user = snapshot.data;

          return Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                alignment: Alignment.topLeft,
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32.0),
                    bottomRight: Radius.circular(32.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Row(
                        children: [
                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              CircleAvatar(
                                radius: 32.0,
                                backgroundColor: Colors.grey.shade400,
                                child: Icon(
                                  Icons.account_circle,
                                  size: 48.0,
                                ),
                              ),
                              CircleAvatar(
                                radius: 8.0,
                                child: Icon(
                                  Icons.edit,
                                  color: Colors.white,
                                  size: 12.0,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${localizations.hello}, ${user?.username ?? ''}',
                                  style: textTheme.titleLarge,
                                ),
                                Text(localizations.howAreYouFeelingToday,
                                    style: textTheme.bodyLarge),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: MoodListWidget(
                        onMoodTapped: (mood) {
                          context.push('/create-mood', extra: mood);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
