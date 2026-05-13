import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/dish.dart';
import '../repositories/dish_repository.dart';
import '../repositories/restaurant_repository.dart';
import '../services/recommendation_engine.dart';
import '../main.dart'; 

final restaurantRepositoryProvider = Provider((ref) {
  return RestaurantRepository(ref.watch(isarProvider));
});

final dishRepositoryProvider = Provider((ref) {
  return DishRepository(ref.watch(isarProvider));
});

final recommendationEngineProvider = Provider((ref) {
  return RecommendationEngine(ref.watch(isarProvider));
});

final selectedMoodProvider = StateProvider<String?>((ref) => null);

final recommendationsProvider = FutureProvider<List<Dish>>((ref) async {
  final engine = ref.watch(recommendationEngineProvider);
  final mood = ref.watch(selectedMoodProvider);
  
  if (mood == null) return [];

  return await engine.getRecommendations(
    lat: 40.7128,
    lon: -74.0060,
    maxDistanceKm: 10.0,
    maxBudget: 50.0,
    preferredFlavors: mood == 'Cozy' ? ['Comfort', 'Warm'] : [],
  );
});
