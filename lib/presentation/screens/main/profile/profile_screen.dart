import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Мой профиль', backgroundColor: AppColors.tertiary),

      ],
    );
  }
}
