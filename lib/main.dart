import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/presentation/resources/app_themes.dart';
import 'package:oggetto_r136a1/presentation/screens/login/login_bloc/login_bloc.dart';
import 'package:oggetto_r136a1/presentation/screens/login/login_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/main/main_bloc/main_bloc.dart';
import 'package:oggetto_r136a1/presentation/screens/main/main_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/registration/registration_bloc/registration_bloc.dart';
import 'package:oggetto_r136a1/presentation/screens/registration/registration_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegistrationBloc>(
          create: (context) => RegistrationBloc(),
        ),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(),
        ),
        BlocProvider<MainBloc>(
          create: (context) => MainBloc(),
        ),

      ],
      child: MaterialApp(
        theme: AppThemes.appTheme,
        routes: {
          '/': (context) => const SplashScreen(),
          '/registration': (context) => const RegistrationScreen(),
          '/login': (context) => const LoginScreen(),
          '/main': (context) => const MainScreen(),
        },
        initialRoute: '/',

      ),
    );
  }
}
