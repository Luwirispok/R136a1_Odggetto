import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_list_event.dart';
part 'check_list_state.dart';

class CheckListBloc extends Bloc<CheckListEvent, CheckListState> {
  CheckListBloc() : super(CheckListInitial()) {
    on<CheckListEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
