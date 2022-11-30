part of 'profile_bloc.dart';


class ProfileState {
  // const ProfileState({this.listCheckItem, this.token});
  //
  // final String? token;
  // final List<CheckItem>? listCheckItem;
  //
  // ProfileState copyWith({
  //   String? token,
  //   List<CheckItem>? listCheckItem,
  // }) {
  //   return ProfileState(
  //     token: token ?? this.token,
  //     listCheckItem: listCheckItem ?? this.listCheckItem,
  //   );
  // }
}

class ProfileExitState extends ProfileState {
}

class ProfileCheckListState extends ProfileState {
  List<CheckItem>? listCheckItem;
  ProfileCheckListState({this.listCheckItem});
}
