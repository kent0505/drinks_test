import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/core/config/router.dart';
import 'src/core/config/themes.dart';
import 'src/blocs/navbar/navbar_bloc.dart';
import 'src/blocs/mix/mix_bloc.dart';
import 'src/core/utils.dart';

Future<void> main() async {
  await initializeDb();
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    precacheImage(const AssetImage('assets/bg1.png'), context);

    precacheImage(const AssetImage('assets/bg2.jpg'), context);

    precacheImage(const AssetImage('assets/bg3.jpg'), context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavbarBloc()),
        BlocProvider(create: (context) => MixBloc()),
      ],
      child: MaterialApp.router(
        routerConfig: routerConfig,
        theme: theme,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
