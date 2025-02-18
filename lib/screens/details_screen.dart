import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  final Map<String, dynamic> recipe;
  final Function(Map<String, dynamic>) onFavoriteToggle;
  final bool isFavorite;

  const DetailsScreen({
    super.key,
    required this.recipe,
    required this.onFavoriteToggle,
    required this.isFavorite,
  });

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late bool isFavorite;

  @override
  void initState() {
    super.initState();
    isFavorite = widget.isFavorite;
  }

  void toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
    widget.onFavoriteToggle(widget.recipe);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.recipe['name'])),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ingredients:", style: Theme.of(context).textTheme.titleLarge), // ✅ Fixed from headline6
            Text(widget.recipe['ingredients']),
            const SizedBox(height: 16),
            Text("Instructions:", style: Theme.of(context).textTheme.titleLarge), // ✅ Fixed from headline6
            Text(widget.recipe['instructions']),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: toggleFavorite,
              child: Text(isFavorite ? "Remove from Favorites" : "Add to Favorites"),
            ),
          ],
        ),
      ),
    );
  }
}
