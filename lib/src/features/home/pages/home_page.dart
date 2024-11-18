import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils.dart';
import '../../../blocs/navbar/navbar_bloc.dart';
import '../../../core/widgets/custom_scaffold.dart';
import '../widgets/nav_bar.dart';
import 'history_page.dart';
import 'recipes_page.dart';
import 'mix_page.dart';
import 'settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Stack(
        children: [
          BlocConsumer<NavbarBloc, NavbarState>(
            listener: (context, state) {
              logger(state.runtimeType);
            },
            builder: (context, state) {
              if (state is NavbarMix) return const MixPage();

              if (state is NavbarHistory) return const HistoryPage();

              if (state is NavbarSettings) return const SettingsPage();

              return const RecipesPage();
            },
          ),
          const NavBar(),
        ],
      ),
    );
  }
}
