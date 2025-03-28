import 'package:dalel/features/bazar/presentation/bloc/bazar_bloc.dart';
import 'package:dalel/features/home/presentation/bloc/home_bloc.dart';
import 'package:dalel/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:dalel/features/search/presentation/bloc/search_bloc.dart';
import 'package:dalel/features/splash.dart';
import 'package:dalel/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(),
        ),
        BlocProvider(create: (context) => SearchBloc()..add(GetSavedData())),
        BlocProvider(
          create: (context) => BazarBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc()..add(GetProfileEvent()),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
