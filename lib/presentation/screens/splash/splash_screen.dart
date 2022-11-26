import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/presentation/screens/splash/splash_bloc/splash_bloc.dart';
import 'package:oggetto_r136a1/presentation/resources/app_images.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashBloc(context),
      child: BlocBuilder<SplashBloc, SplashState>(
        builder: (context, state) {
          context.read<SplashBloc>().add(Init());
          return Scaffold(
            body: SafeArea(
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
          );
        },
      ),
    );
  }
}
