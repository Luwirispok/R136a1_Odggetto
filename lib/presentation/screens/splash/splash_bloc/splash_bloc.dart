import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc(this.context) : super(SplashInitial()) {
    on<Init>((event, emit) async {
      Timer(const Duration(milliseconds: 1000), () {
        Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
      });
    });
  }

  final BuildContext context;
}
