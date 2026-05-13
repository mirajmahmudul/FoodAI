import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'theme/app_theme.dart';
import 'screens/onboarding_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([
    // Register your collections here
    // e.g., RestaurantSchema, DishSchema, TagSchema, UserPreferenceSchema
  ], directory: dir.path);

  runApp(ProviderScope(overrides: [
    // Provide the Isar instance to the app
    isarProvider.overrideWithValue(isar),
  ], child: const MoodDishApp()));
}

final isarProvider = Provider<Isar>((ref) => throw UnimplementedError());

class MoodDishApp extends ConsumerWidget {
  const MoodDishApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'MoodDish',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      home: const OnboardingScreen(),
    );
  }
}
