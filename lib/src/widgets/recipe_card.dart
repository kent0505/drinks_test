import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/config/fonts.dart';
import '../core/models/recipe.dart';
import 'arrow_right.dart';
import 'cuper_button.dart';
import 'custom_container.dart';
import 'svg_widget.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: 192,
      borderRadius: 12,
      child: CuperButton(
        onPressed: () {
          context.push('/recipe', extra: recipe);
        },
        child: Row(
          children: [
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Container(
                        height: 36,
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            recipe.title,
                            style: const TextStyle(
                              color: Color(0xffD13535),
                              fontSize: 20,
                              fontFamily: Fonts.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      const SizedBox(width: 4),
                      const SvgWidget('assets/star1.svg'),
                      const SizedBox(width: 4),
                      const SvgWidget('assets/star1.svg'),
                      const SizedBox(width: 4),
                      const SvgWidget('assets/star1.svg'),
                      const SizedBox(width: 4),
                      const SvgWidget('assets/star1.svg'),
                      const SizedBox(width: 4),
                      const SvgWidget('assets/star2.svg'),
                      const SizedBox(width: 16),
                      Text(
                        recipe.rate.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: Fonts.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    recipe.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: Fonts.w700,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 100,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Expanded(
                    child: SvgWidget('assets/glass${recipe.id}.svg'),
                  ),
                  const SizedBox(height: 10),
                  const ArrowRight(),
                  const SizedBox(height: 12),
                ],
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
      ),
    );
  }
}
