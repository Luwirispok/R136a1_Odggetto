import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/presentation/resources/app_themes.dart';
import 'package:oggetto_r136a1/presentation/screens/login_and_registration/login/login_bloc/login_bloc.dart';
import 'package:oggetto_r136a1/presentation/screens/login_and_registration/login/login_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/login_and_registration/registration/registration_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/login_and_registration/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:oggetto_r136a1/presentation/screens/main/navigation/navigation_bloc/navigation_bloc.dart';
import 'package:oggetto_r136a1/presentation/screens/main/navigation/navigation_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/main/profile/profile_bloc/profile_bloc.dart';
import 'firebase_options.dart';
import 'presentation/screens/login_and_registration/registration/registration_bloc/registration_bloc.dart';

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
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => ProfileBloc(),
        ),

      ],
      child: MaterialApp(
        theme: AppThemes.appTheme,
        routes: {
          '/': (context) => const SplashScreen(),
          '/registration': (context) => const RegistrationScreen(),
          '/login': (context) => const LoginScreen(),
          '/navigation': (context) => const NavigationScreen(),
        },
        initialRoute: '/',

      ),
    );
  }
}
