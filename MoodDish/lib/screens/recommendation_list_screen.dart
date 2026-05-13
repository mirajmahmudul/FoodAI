import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/app_providers.dart';
import 'dish_detail_screen.dart';

class RecommendationListScreen extends ConsumerWidget {
  const RecommendationListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recommendationsAsync = ref.watch(recommendationsProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Recommendations')),
      body: recommendationsAsync.when(
        data: (dishes) {
          if (dishes.isEmpty) {
            return const Center(child: Text('No dishes found for this mood.'));
          }
          return ListView.builder(
            itemCount: dishes.length,
            itemBuilder: (context, index) {
              final dish = dishes[index];
              return ListTile(
                title: Text(dish.name),
                subtitle: Text('\$${dish.price.toStringAsFixed(2)}'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => DishDetailScreen(dish: dish)),
                  );
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }
}
