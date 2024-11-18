import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/config/fonts.dart';
import 'svg_widget.dart';
import 'cuper_button.dart';
import '../blocs/navbar/navbar_bloc.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 76,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 18),
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 1,
              color: Colors.white,
            ),
          ),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff004EB5),
              Color(0xff1F6846),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Color(0xff2AD585),
              blurRadius: 10,
              spreadRadius: 5,
            ),
          ],
        ),
        child: BlocBuilder<NavbarBloc, NavbarState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Button(
                  id: 1,
                  title: 'Recipes',
                  active: state is NavbarInitial,
                ),
                _Button(
                  id: 2,
                  title: 'Mix',
                  active: state is NavbarMix,
                ),
                _Button(
                  id: 3,
                  title: 'History',
                  active: state is NavbarHistory,
                ),
                _Button(
                  id: 4,
                  title: 'Settings',
                  active: state is NavbarSettings,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.id,
    required this.title,
    required this.active,
  });

  final int id;
  final String title;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return CuperButton(
      onPressed: () {
        if (!active) context.read<NavbarBloc>().add(ChangePageEvent(index: id));
      },
      padding: 0,
      child: SizedBox(
        width: 62,
        child: Column(
          children: [
            const SizedBox(height: 10),
            SizedBox(
              height: 58,
              width: 58,
              child: Stack(
                children: [
                  if (active) const SvgWidget('assets/tab_active.svg'),
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 8),
                        SvgWidget('assets/tab$id.svg'),
                        const SizedBox(height: 6),
                        Text(
                          title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontFamily: Fonts.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
