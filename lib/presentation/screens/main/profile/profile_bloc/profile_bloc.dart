import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:oggetto_r136a1/repository/entities/check_item.dart';
import 'package:oggetto_r136a1/repository/firebase_realtime_database/check_list_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileState()) {
    on<ExitEvent>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      log('Пользователь вышел');
      emit(ProfileExitState());
      emit(ProfileState());
    });
    on<CheckListEvent>((event, emit) async {
      CheckListRepository checkListRepository = CheckListRepository();
      List<CheckItem>? standardCheckList = await checkListRepository.getStandardCheckList();
      log(standardCheckList.toString(), name: "CheckListRepository");
      if (standardCheckList != null) {
        emit(ProfileCheckListState(listCheckItem: standardCheckList));
      }
    });
  }
}
