import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/screens/main/employee_details/employee_details_screen.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/tile/profile_tile.dart';
import 'package:oggetto_r136a1/repository/entities/employee.dart';
import 'package:oggetto_r136a1/repository/entities/user.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key, required this.listEmployee}) : super(key: key);

  final List<UserOd> listEmployee;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(title: 'Сотрудники', backgroundColor: AppColors.tertiary),
        Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) {
              var user = listEmployee[index];
              return ProfileTile(
                title: '${user.surname ?? ''} ${user.name ?? ''} ${user.patronymic ?? ''}',
                text1: user.job?.jobTitle,
                text2: user.job?.grade,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmployeeDetailsScreen(user: user),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => 10.emptyHeight,
            itemCount: listEmployee.length,
          ),
        ),
      ],
    );
  }
}
