import 'package:go_router/go_router.dart';

import '../../pages/history_detail_page.dart';
import '../../pages/home_page.dart';
import '../../pages/onboard_page.dart';
import '../../pages/recipe_detail_page.dart';
import '../../pages/splash_page.dart';
import '../models/mix_model.dart';
import '../models/recipe.dart';

final routerConfig = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/onboard',
      builder: (context, state) => const OnboardPage(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/recipe',
      builder: (context, state) => RecipeDetailPage(
        recipe: state.extra as Recipe,
      ),
    ),
    GoRoute(
      path: '/history',
      builder: (context, state) => HistoryDetailPage(
        mixModel: state.extra as MixModel,
      ),
    ),
  ],
);
