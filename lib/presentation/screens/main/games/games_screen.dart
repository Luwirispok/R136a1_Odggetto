import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/screens/quiz/getQuestions/main_widget.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/profile_tile.dart';

class GamesScreen extends StatelessWidget {
  const GamesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Игры', backgroundColor: AppColors.tertiary),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainWidget(),
              ),
            );
          },
          child: const ProfileTile(
            title: 'Квиз',
          ),
        )
      ],
    );
  }
}
