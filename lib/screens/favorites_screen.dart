import 'package:flutter/material.dart';
import 'details_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteRecipes;

  const FavoritesScreen({super.key, required this.favoriteRecipes});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Favorite Recipes")),
      body: favoriteRecipes.isEmpty
          ? const Center(child: Text("No favorite recipes yet."))
          : ListView.builder(
        itemCount: favoriteRecipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(favoriteRecipes[index]['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: favoriteRecipes[index],
                    onFavoriteToggle: (recipe) {},
                    isFavorite: true,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
