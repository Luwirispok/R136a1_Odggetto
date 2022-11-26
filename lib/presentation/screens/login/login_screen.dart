import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/resources/app_images.dart';
import 'package:oggetto_r136a1/presentation/screens/login/login_bloc/login_bloc.dart';
import 'package:oggetto_r136a1/presentation/widgets/buttons/base_button.dart';
import 'package:oggetto_r136a1/presentation/widgets/inputs/default_input.dart';
import 'package:oggetto_r136a1/presentation/widgets/safe_area_with_background.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeAreaWithBackground(
          child: _buildBody(context),
        ));
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if(state.error is NotLoginError){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ошибка в логине или пароле', style: TextStyle(color: Colors.black),)));
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            128.emptyHeight,
            const Image(image: AppImages.logoVertical),
            46.emptyHeight,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: DefaultInput(
                label: 'Email',
                onChanged: (text) {
                  context.read<LoginBloc>().add(EmailEvent(email: text));
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            22.emptyHeight,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 46),
              child: DefaultInput(
                label: 'Пароль',
                onChanged: (text) {
                  context.read<LoginBloc>().add(PasswordEvent(password: text));
                },
                textInputAction: TextInputAction.done,
              ),
            ),
            48.emptyHeight,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 93),
              child: BaseButton(
                text: 'Войти',
                onTap: () {
                  context.read<LoginBloc>().add(SendClickedEnterEvent());
                },
              ),
            ),
            20.emptyHeight,
            _buildTextRegistration(context),
            108.emptyHeight
          ],
        ),
      ),
    );
  }

  Widget _buildTextRegistration(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Wrap(
        children: [
          const Text(
            'Еще нет аккаунта? ',
            style: TextStyle(color: AppColors.onBackground),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/registration');
            },
            child: const Text(
              'Зарегистрироваться',
              style: TextStyle(color: AppColors.onBackground, fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
