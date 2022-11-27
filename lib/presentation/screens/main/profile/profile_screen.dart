import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/profile_tile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomAppBar(title: 'Мой профиль', backgroundColor: AppColors.tertiary),
      ProfileTile(
        title: 'Байсова Cjamz Etymtdyf',
        text1: '15.03.1999',
        text2: 'junior',
        onTap: () {},
      ),
      tileWithAction(
        icon: Icons.person_outline,
        title: 'Подробнее',
        onTap: () {},
      ),
      tileWithAction(
        icon: Icons.fact_check_outlined,
        title: 'Чек-лист',
        onTap: () {},
      ),
      tileWithAction(
        icon: Icons.exit_to_app_outlined,
        title: 'Выход',
        onTap: () {},
      ),
    ]);
  }

  Widget tileWithAction({required IconData icon, required String title, required Function() onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GestureDetector(
        onTap: onTap(),
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
