import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/safe_area_with_background.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/list_text_tile.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/profile_tile.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/text_tile.dart';
import 'package:oggetto_r136a1/repository/entities/user.dart';

class EmployeeDetailsScreen extends StatelessWidget {
  EmployeeDetailsScreen({Key? key, required this.user}) : super(key: key);

  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWithBackground(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Подробнее о сотруднике', backgroundColor: AppColors.tertiary, isBack: true),
        ProfileTile(
          title: '${user.surname} ${user.name} ${user.patronymic}',
          text1: user.job?.jobTitle,
          text2: user.job?.grade,
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              children: [
                _buildBlocProfile(
                  children: [
                    TextTile(title: 'Город', text: user.aboutMe?.city),
                    7.emptyHeight,
                    ListTextTile(title: 'Профессиональные навыки', textList: user.aboutMe?.professionalSkills),
                    7.emptyHeight,
                    ListTextTile(title: 'Хобби', textList: user.aboutMe?.hobby),
                    7.emptyHeight,
                    TextTile(title: 'Обо мне', text: user.aboutMe?.description),
                    7.emptyHeight,
                    ListTextTile(title: 'Факты', textList: user.aboutMe?.facts),
                  ],
                ),
                10.emptyHeight,
                _buildBlocProfile(
                  children: [
                    TextTile(title: 'Должность', text: user.job?.jobTitle),
                    7.emptyHeight,
                    TextTile(title: 'Грэйд', text: user.job?.grade),
                    7.emptyHeight,
                    ListTextTile(title: 'Проекты', textList: user.job?.projects),
                    7.emptyHeight,
                    TextTile(title: 'Команда', text: user.job?.team),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBlocProfile({required List<Widget> children}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.grey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
