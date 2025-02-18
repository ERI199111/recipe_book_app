import 'package:flutter/material.dart';
import 'details_screen.dart';
import 'favorites_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Map<String, dynamic>> recipes = [
    {"name": "Pancakes", "ingredients": "Flour, Eggs, Milk", "instructions": "Mix and cook on a pan."},
    {"name": "Spaghetti", "ingredients": "Pasta, Tomato Sauce, Meat", "instructions": "Boil pasta and mix with sauce."},
    {"name": "Salad", "ingredients": "Lettuce, Tomato, Cucumber", "instructions": "Chop and mix ingredients."},
  ];

  List<Map<String, dynamic>> favoriteRecipes = [];

  void toggleFavorite(Map<String, dynamic> recipe) {
    setState(() {
      if (favoriteRecipes.contains(recipe)) {
        favoriteRecipes.remove(recipe);
      } else {
        favoriteRecipes.add(recipe);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Recipe Book")),
      body: ListView.builder(
        itemCount: recipes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recipes[index]['name']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailsScreen(
                    recipe: recipes[index],
                    onFavoriteToggle: toggleFavorite,
                    isFavorite: favoriteRecipes.contains(recipes[index]),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.favorite),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FavoritesScreen(favoriteRecipes: favoriteRecipes),
            ),
          );
        },
      ),
    );
  }
}
