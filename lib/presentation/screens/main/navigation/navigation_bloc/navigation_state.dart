part of 'navigation_bloc.dart';

class NavigationState {
  const NavigationState( {this.listEmployee, required this.token, this.userOd});

  final String token;
  final UserOd? userOd;
  final List<UserOd>? listEmployee;

  NavigationState copyWith({
    String? token,
    UserOd? userOd,
    List<UserOd>? listEmployee,
  }) {
    return NavigationState(
      token: token ?? this.token,
      userOd: userOd ?? this.userOd,
      listEmployee:  listEmployee ?? this.listEmployee,
    );
  }
}
