import 'dart:ui';

import 'package:drinks_test/src/widgets/custom_container.dart';
import 'package:drinks_test/src/widgets/rotated_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../core/config/fonts.dart';
import '../core/models/recipe.dart';
import '../core/utils.dart';
import '../widgets/cuper_button.dart';
import '../widgets/custom_scaffold.dart';
import '../widgets/svg_widget.dart';
import '../widgets/title_text.dart';

class RecipeDetailPage extends StatelessWidget {
  const RecipeDetailPage({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(height: 20 + getStatusBar(context)),
              const TitleText('RECIPE'),
              const SizedBox(height: 20),
              Container(
                height: 255,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    width: 2,
                    color: const Color(0xffA22AD5),
                  ),
                ),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        'assets/bg3.jpg',
                        fit: BoxFit.cover,
                        height: 255,
                      ),
                    ),
                    Positioned(
                      top: -100,
                      left: -100,
                      child: RotatedWidget(
                        degree: 22,
                        child: Image.asset(
                          'assets/bg1.png',
                          height: 455,
                        ),
                      ),
                    ),
                    Positioned(
                      top: -200,
                      right: -200,
                      child: RotatedWidget(
                        degree: -25,
                        child: Image.asset(
                          'assets/bg1.png',
                          height: 455,
                        ),
                      ),
                    ),
                    Center(
                      child: Column(
                        children: [
                          const Spacer(),
                          SvgWidget(
                            'assets/glass${recipe.id}.svg',
                            height: 160,
                          ),
                          const SizedBox(height: 20),
                          Container(
                            height: 38,
                            width: 133,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.8),
                                  blurRadius: 4,
                                  offset: const Offset(0, 4),
                                ),
                              ],
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
                          const Spacer(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                borderRadius: 12,
                child: SizedBox(
                  height: 54,
                  child: Row(
                    children: [
                      const SizedBox(width: 22),
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
                ),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                borderRadius: 12,
                padding: 12,
                child: Text(
                  recipe.description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: Fonts.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                borderRadius: 12,
                padding: 12,
                child: Text(
                  recipe.ingredients,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: Fonts.w600,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CustomContainer(
                borderRadius: 12,
                padding: 12,
                child: Text(
                  recipe.preparation,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: Fonts.w600,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20 + getStatusBar(context),
            left: 24,
            child: CuperButton(
              onPressed: () {
                context.pop();
              },
              minSize: 34,
              child: const SvgWidget('assets/back.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
