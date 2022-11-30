part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}

class ExitEvent extends ProfileEvent{}

class CheckListEvent extends ProfileEvent{}
