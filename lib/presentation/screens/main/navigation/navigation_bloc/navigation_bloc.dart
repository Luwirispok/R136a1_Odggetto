import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:oggetto_r136a1/repository/entities/employee.dart';
import 'package:oggetto_r136a1/repository/entities/user.dart';
import 'package:oggetto_r136a1/repository/firebase_realtime_database/user_repository.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationState(token: FirebaseAuth.instance.currentUser!.uid)) {
    on<Init>((event, emit) async {
      String? token = FirebaseAuth.instance.currentUser?.uid;
      log(token.toString());
      if(token != null){
        UserRepository userRepository = UserRepository();
        UserOd? user = await userRepository.getUser(token);
        List<UserOd>? listEmployees = await userRepository.getAllUsers();
        log(user.toString(), name: "NavigationBloc - user");
        if (user != null || listEmployees != null) {
          emit(state.copyWith(userOd: user, listEmployee: listEmployees));
        }
      }
    });
    add(Init());
  }
}
