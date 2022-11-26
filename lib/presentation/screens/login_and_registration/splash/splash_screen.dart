import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/presentation/resources/app_images.dart';
import 'package:oggetto_r136a1/presentation/screens/login_and_registration/splash/splash_bloc/splash_bloc.dart';
import 'package:oggetto_r136a1/presentation/widgets/safe_area_with_background.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if(state is LoginState) {
            Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
          }
          if(state is MainState) {
            Navigator.pushNamedAndRemoveUntil(context, '/navigation', (_) => false);
          }
        },
        child: Scaffold(
              body: SafeAreaWithBackground(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Spacer(flex: 3),
                      Image(image: AppImages.logoHorizontal),
                      Spacer(flex: 2),
                      CircularProgressIndicator(
                        color: Colors.amber,
                      ),
                      Spacer(flex: 2),
                    ],
                  ),
                ),
              ),
            ),
        ),
    );
  }
}
