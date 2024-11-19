import 'package:flutter/material.dart';

import '../core/models/recipe.dart';
import '../core/utils.dart';
import '../widgets/text_stroke.dart';
import '../widgets/recipe_card.dart';
import '../widgets/txt_field.dart';

class RecipesPage extends StatefulWidget {
  const RecipesPage({super.key});

  @override
  State<RecipesPage> createState() => _RecipesPageState();
}

class _RecipesPageState extends State<RecipesPage> {
  final controller = TextEditingController();

  List<Recipe> filteredRecipes = List.from(cocktailRecipes);

  void onChanged(String value) {
    setState(() {
      filteredRecipes = cocktailRecipes
          .where((recipe) =>
              recipe.title.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(height: 20 + statusBar(context)),
        const Center(
          child: TextStroke(
            'What kind of cocktail will you be making?',
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),
        TxtField(
          controller: controller,
          hintText: 'Search',
          onChanged: onChanged,
        ),
        const SizedBox(height: 16),
        ...List.generate(
          filteredRecipes.length,
          (index) {
            return RecipeCard(recipe: filteredRecipes[index]);
          },
        ),
      ],
    );
  }
}
