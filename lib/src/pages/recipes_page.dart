import 'package:flutter/material.dart';

import '../core/models/recipe.dart';
import '../core/utils.dart';
import '../widgets/text_stroke.dart';
import '../widgets/recipe_card.dart';

class RecipesPage extends StatelessWidget {
  const RecipesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        SizedBox(height: 20 + getStatusBar(context)),
        const Center(
          child: TextStroke(
            'What kind of cocktail will you be making?',
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 16),
        // search
        const SizedBox(height: 16),
        ...List.generate(
          cocktailRecipes.length,
          (index) {
            return RecipeCard(recipe: cocktailRecipes[index]);
          },
        ),
      ],
    );
  }
}
