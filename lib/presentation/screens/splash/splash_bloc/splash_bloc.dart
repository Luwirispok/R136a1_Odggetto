import 'dart:async';
import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:meta/meta.dart';

part 'splash_event.dart';

part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<Init>(
      (event, emit) async {
        if ((FirebaseAuth.instance.currentUser) != null) {
          print('Пользователь уже в системе');
          log('MainState');
          emit(MainState());
        } else {
          emit(LoginState());
        }
      },
    );
    add(Init());
  }
}
