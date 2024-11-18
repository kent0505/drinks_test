import 'package:flutter/material.dart';

class RecipeCard extends StatelessWidget {
  const RecipeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 192,
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Colors.white,
        ),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff6000B5),
            Color(0xff000D99),
          ],
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffA22AD5),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
    );
  }
}
