import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/mix/mix_bloc.dart';
import '../blocs/navbar/navbar_bloc.dart';
import '../core/config/fonts.dart';
import '../core/models/ingredient.dart';
import '../core/models/mix_model.dart';
import '../core/models/recipe.dart';
import '../core/utils.dart';
import '../widgets/cuper_button.dart';
import '../widgets/mix_button.dart';
import '../widgets/text_stroke.dart';
import '../widgets/title_text.dart';

class MixPage extends StatefulWidget {
  const MixPage({super.key});

  @override
  State<MixPage> createState() => _MixPageState();
}

class _MixPageState extends State<MixPage> {
  String current = '';

  List<String> selectedList = [];
  late Ingredient currentIngredient;

  void onCurrent(String value) {
    setState(() {
      for (Ingredient ingredient in ingredientsList) {
        if (ingredient.title == value) currentIngredient = ingredient;
      }
      selectedList = [];
      current = value;
    });
  }

  void onSelect(String value) {
    setState(() {
      for (String selected in selectedList) {
        if (value == selected) {
          selectedList.remove(value);
          return;
        }
      }
      selectedList.add(value);
    });
    logger(selectedList);
  }

  void onRandom() {
    List<String> all = current == 'All'
        ? ingredientsList.expand((ingredient) => ingredient.children).toList()
        : currentIngredient.children;
    all.shuffle(Random());
    int count =
        current == 'All' ? Random().nextInt(3) + 3 : Random().nextInt(2) + 2;
    selectedList = all.take(count).toList();
    logger(selectedList);
    setState(() {});
  }

  void onReset() {
    setState(() {
      selectedList = [];
    });
  }

  void onMix() {
    if (selectedList.isEmpty) return;
    Recipe recipe = cocktailRecipes[Random().nextInt(ingredientsList.length)];
    context.read<MixBloc>().add(
          AddMixEvent(
            mix: MixModel(
              date: getTimestamp(),
              id: recipe.id,
              title: recipe.title,
              ingredients: selectedList,
            ),
          ),
        );
    context.read<NavbarBloc>().add(ChangePageEvent(index: 3));
  }

  @override
  void initState() {
    super.initState();
    current = 'All';
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(height: 20 + getStatusBar(context)),
            const TitleText('CREATE YOUR\nOWN COCTAIL'),
            const SizedBox(height: 20),
            SizedBox(
              height: 40,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  const SizedBox(width: 24),
                  MixButton(
                    title: 'All',
                    current: current,
                    onPressed: onCurrent,
                  ),
                  ...ingredientsList.map(
                    (ingredient) => MixButton(
                      title: ingredient.title,
                      current: current,
                      onPressed: onCurrent,
                    ),
                  ),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            if (current == 'All')
              ...List.generate(
                ingredientsList.length,
                (index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 33),
                      _Title(ingredientsList[index].title),
                      const SizedBox(height: 20),
                      _Wrap(
                        data: ingredientsList[index].children,
                        selectedList: selectedList,
                        onSelect: onSelect,
                      ),
                    ],
                  );
                },
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 33),
                  _Title(currentIngredient.title),
                  const SizedBox(height: 20),
                  _Wrap(
                    data: currentIngredient.children,
                    selectedList: selectedList,
                    onSelect: onSelect,
                  ),
                ],
              ),
            const SizedBox(height: 100),
          ],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              const SizedBox(width: 10),
              _Button(
                title: 'Random',
                shadowColor: const Color(0xffA22AD5),
                gradientColors: const [Color(0xff8927AC), Color(0xff5D18C9)],
                onPressed: onRandom,
              ),
              const SizedBox(width: 10),
              _Button(
                title: 'Reset',
                shadowColor: const Color(0xffA53B3B),
                gradientColors: const [Color(0xffA53B3B), Color(0xffA53B3B)],
                onPressed: onReset,
              ),
              const SizedBox(width: 10),
              _Button(
                title: 'Mix coctail',
                shadowColor: const Color(0xff3B9AA5),
                gradientColors: const [Color(0xff3B9AA5), Color(0xff3B9AA5)],
                onPressed: onMix,
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class _Title extends StatelessWidget {
  const _Title(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24),
      child: TextStroke(
        title,
        fontSize: 20,
        shadows: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
    );
  }
}

class _Wrap extends StatelessWidget {
  const _Wrap({
    required this.data,
    required this.selectedList,
    required this.onSelect,
  });

  final List<String> data;
  final List<String> selectedList;
  final void Function(String) onSelect;

  @override
  Widget build(BuildContext context) {
    String getCurrent(String value) {
      for (String selected in selectedList) {
        if (value == selected) return selected;
      }
      return '';
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Wrap(
        spacing: 8,
        runSpacing: 16,
        children: data
            .map(
              (title) => MixButton(
                title: title,
                current: getCurrent(title),
                onPressed: onSelect,
              ),
            )
            .toList(),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.shadowColor,
    required this.gradientColors,
    required this.onPressed,
  });

  final String title;
  final Color shadowColor;
  final List<Color> gradientColors;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CuperButton(
        onPressed: onPressed,
        child: Container(
          height: 44,
          margin: const EdgeInsets.only(bottom: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              width: 1,
              color: Colors.white,
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: gradientColors,
            ),
            boxShadow: [
              BoxShadow(
                color: shadowColor,
                blurRadius: 10,
                spreadRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: Fonts.w900,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
