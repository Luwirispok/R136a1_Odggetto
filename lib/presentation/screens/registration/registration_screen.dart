import 'package:flutter/material.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/back_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/buttons/base_button.dart';
import 'package:oggetto_r136a1/presentation/widgets/inputs/default_input.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const BackAppBar(
            title: 'Регистрация',
          ),
          23.emptyHeight,
          _buildProfile(context),
          50.emptyHeight,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 90),
            child: BaseButton(
              text: 'Продолжить',
              onTap: () {},
            ),
          ),

        ],
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          DefaultInput(
            label: 'Фамилия',
            textInputAction: TextInputAction.next,
            onChanged: (text) {},
          ),
          30.emptyHeight,
          DefaultInput(
            label: 'Имя',
            textInputAction: TextInputAction.next,
            onChanged: (text) {},
          ),
          30.emptyHeight,
          DefaultInput(
            label: 'Отчество',
            textInputAction: TextInputAction.next,
            onChanged: (text) {},
          ),
          30.emptyHeight,
          DefaultInput(
            label: 'Email',
            textInputAction: TextInputAction.next,
            onChanged: (text) {},
          ),
          30.emptyHeight,
          DefaultInput(
            label: 'Пароль',
            textInputAction: TextInputAction.done,
            onChanged: (text) {},
          ),
        ],
      ),
    );
  }
}
