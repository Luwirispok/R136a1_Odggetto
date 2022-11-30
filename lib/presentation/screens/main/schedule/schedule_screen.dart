import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/profile_tile.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Мероприятия', backgroundColor: AppColors.tertiary),
        ProfileTile(
          title: 'Игра в мафию',
          text1: '19.06.2022',

        ),
        ProfileTile(
          title: 'Игра в мафию',
          text1: '19.06.2022',

        ),
      ],
    );
  }
}
