import 'dart:async';
import 'dart:developer';
import 'package:flutter/material.dart';

import 'package:bloc/bloc.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:oggetto_r136a1/core/validation/email.dart';

import 'package:oggetto_r136a1/core/validation/password.dart';
import 'package:oggetto_r136a1/repository/firebase_auth/registrationInFirebase.dart';

part 'registration_event.dart';

part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  RegistrationBloc() : super(RegistrationState(email: EmailForm.pure(''), password: PasswordForm.pure(''),)) {
    on<SurnameEvent>((event, emit) {
      emit(state.copyWith(surname: event.surname));
    });
    on<NameEvent>((event, emit) {
      emit(state.copyWith(name: event.name));
    });
    on<FatherNameEvent>((event, emit) {
      emit(state.copyWith(fatherName: event.fatherName));
    });
    on<EmailEvent>((event, emit) {
      emit(state.copyWith(email: EmailForm.dirty(event.email)));
    });
    on<PasswordEvent>((event, emit) {
      emit(state.copyWith(password: PasswordForm.dirty(event.password)));
    });
    on<SignUpEvent>(_onSignUpEventEvent);
  }


  Future<FutureOr<void>> _onSignUpEventEvent(SignUpEvent event, Emitter<dynamic> emit) async {
    emit(state.copyWith(isLoading: true));
    if (state.email.valid && state.password.valid && state.name != null && state.surname != null) {
      try {
        ///Запросы здесь отправлять
        String? token = await RegistrationFirebaseAuth().registration(state.email.value, state.password.value);
        DatabaseReference ref = FirebaseDatabase.instance.ref('Users/$token/');
        if (token != null) {
          await ref.set(
            {
              'email': state.email!.value,
              'name': state.name,
              'patronymic': state.fatherName,
              'sureName': state.surname,
            },
          );
          emit(SuccessState(email: state.email, password: state.password));
        }
      } catch (e) {
        log(e.toString());
        emit(state.copyWith(error: NetworkError(error: e.toString())));
      }
    } else {
      emit(state.copyWith(error: NotValidError(error: 'Заполните поля правильно')));
    }
    emit(state.copyWith(isLoading: false));
  }
}
