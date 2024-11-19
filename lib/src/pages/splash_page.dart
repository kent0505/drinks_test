import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../blocs/mix/mix_bloc.dart';
import '../core/utils.dart';
import '../widgets/my_loading.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  void init() {
    context.read<MixBloc>().add(GetMixEvent());
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        if (onboard) {
          context.go('/onboard');
        } else {
          context.go('/home');
        }
      }
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff6000B5),
              Color(0xff000D99),
            ],
          ),
        ),
        child: const MyLoading(),
      ),
    );
  }
}
