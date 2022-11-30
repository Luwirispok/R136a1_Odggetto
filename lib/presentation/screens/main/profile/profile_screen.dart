import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/screens/main/check_list/check_list.dart';
import 'package:oggetto_r136a1/presentation/screens/main/employee_details/employee_details_screen.dart';
import 'package:oggetto_r136a1/presentation/screens/main/profile/profile_bloc/profile_bloc.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/profile_tile.dart';
import 'package:oggetto_r136a1/repository/entities/user.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key, this.user}) : super(key: key);

  UserOd? user;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is ProfileExitState) {
          log('ProfileExitState');
          Navigator.popAndPushNamed(context, '/login');
        }
        if (state is ProfileCheckListState) {
          log('ProfileCheckListState');
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CheckList(listCheckItem: state.listCheckItem!,),
            ),
          );
        }
      },
      child: Column(children: [
        CustomAppBar(title: 'Мой профиль', backgroundColor: AppColors.tertiary),
        ProfileTile(
          title: '${user?.surname} ${user?.name} ${user?.patronymic}',
          text1: user?.job?.jobTitle,
          text2: user?.job?.grade,
          onEdit: () {},
        ),
        tileWithAction(
          icon: Icons.person_outline,
          title: 'Подробнее',
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => EmployeeDetailsScreen(user: user!),
              ),
            );
          },
        ),
        tileWithAction(
          icon: Icons.fact_check_outlined,
          title: 'Чек-лист',
          onTap: () {
            context.read<ProfileBloc>().add(CheckListEvent());
          },
        ),
        tileWithAction(
          icon: Icons.exit_to_app_outlined,
          title: 'Выход',
          onTap: () {
            context.read<ProfileBloc>().add(ExitEvent());
          },
        ),
      ]),
    );
  }

  Widget tileWithAction({required IconData icon, required String title, required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: () {
          onTap.call();
        },
        child: SizedBox(
          height: 64,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              15.emptyWidth,
              Icon(icon, size: 24, color: AppColors.onBackground),
              109.spacer,
              SizedBox(
                width: 100,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: AppColors.onBackground,
                    fontSize: 16,
                  ),
                ),
              ),
              129.spacer,
            ],
          ),
        ),
      ),
    );
  }
}
