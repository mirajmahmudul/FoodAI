import 'package:isar/isar.dart';
import 'dart:math';
import '../models/dish.dart';

class RecommendationEngine {
  final Isar isar;

  RecommendationEngine(this.isar);

  Future<List<Dish>> getRecommendations({
    required double lat,
    required double lon,
    required double maxDistanceKm,
    required double maxBudget,
    required List<String> preferredFlavors,
  }) async {
    // MVP implementation
    return [];
  }

  // Phase 2: Weighted Scoring Algorithm
  Future<List<Dish>> getRecommendationsWithScoring({
    required double lat,
    required double lon,
    required double maxDistanceKm,
    required double maxBudget,
    required Map<String, double> moodProbabilities,
  }) async {
    final allDishes = await isar.dishs.where().findAll();
    
    List<Map<String, dynamic>> scoredDishes = [];
    
    for (var dish in allDishes) {
      if (dish.price > maxBudget) continue;

      if (dish.restaurant.value != null) {
        double dist = _calculateDistance(
          lat, lon, 
          dish.restaurant.value!.lat, dish.restaurant.value!.lon
        );
        if (dist > maxDistanceKm) continue;
      }

      double score = 0.0;
      
      Map<String, List<String>> moodFlavors = {
        'Cozy': ['Comfort', 'Warm', 'Hearty'],
        'Energetic': ['Spicy', 'Protein', 'Bold'],
        'Light': ['Fresh', 'Salad', 'Healthy'],
        'Adventurous': ['Exotic', 'Fusion', 'Unique']
      };

      for (var entry in moodProbabilities.entries) {
        String mood = entry.key;
        double prob = entry.value;
        
        List<String> expectedFlavors = moodFlavors[mood] ?? [];
        for (var tag in dish.flavorTags) {
          if (expectedFlavors.contains(tag.name)) {
            score += (prob * 1.5);
          }
        }
      }

      score += Random().nextDouble() * 0.1;

      scoredDishes.add({
        'dish': dish,
        'score': score
      });
    }

    scoredDishes.sort((a, b) => b['score'].compareTo(a['score']));

    return scoredDishes.map((e) => e['dish'] as Dish).toList();
  }

  double _calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 - c((lat2 - lat1) * p)/2 + 
            c(lat1 * p) * c(lat2 * p) * 
            (1 - c((lon2 - lon1) * p))/2;
    return 12742 * asin(sqrt(a)); 
  }
}
