import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oggetto_r136a1/core/extension/empty_through_num.dart';
import 'package:oggetto_r136a1/presentation/resources/app_colors.dart';
import 'package:oggetto_r136a1/presentation/screens/login_and_registration/registration/registration_bloc/registration_bloc.dart';
import 'package:oggetto_r136a1/presentation/widgets/appbars/custom_appbar.dart';
import 'package:oggetto_r136a1/presentation/widgets/buttons/base_button.dart';
import 'package:oggetto_r136a1/presentation/widgets/inputs/default_input.dart';
import 'package:oggetto_r136a1/presentation/widgets/safe_area_with_background.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeAreaWithBackground(
        child: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocListener<RegistrationBloc, RegistrationState>(
      listener: (context, state) {
        if(state is SuccessState){
          Navigator.of(context).pushNamed('/navigation');
        }
        if(state.error is NetworkError){
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Проблемы с интернетом', style: TextStyle(color: Colors.black))));
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            const CustomAppBar(
              title: 'Регистрация',
            ),
            23.emptyHeight,
            _buildProfile(context),
            50.emptyHeight,
            _buildButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfile(BuildContext context) {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (prev, cur) => prev.isLoading != cur.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              DefaultInput(
                label: 'Фамилия',
                error: state.surname == null && state.error != null  ? 'Введите фамилию' : null,
                textInputAction: TextInputAction.next,
                onChanged: (text) {
                  context.read<RegistrationBloc>().add(SurnameEvent(surname: text));
                },
              ),
              30.emptyHeight,
              DefaultInput(
                label: 'Имя',
                error: state.name == null && state.error != null ? 'Введите имя' : null,
                textInputAction: TextInputAction.next,
                onChanged: (text) {
                  context.read<RegistrationBloc>().add(NameEvent(name: text));
                },
              ),
              30.emptyHeight,
              DefaultInput(
                label: 'Отчество',
                textInputAction: TextInputAction.next,
                onChanged: (text) {
                  context.read<RegistrationBloc>().add(FatherNameEvent(fatherName: text));
                },
              ),
              30.emptyHeight,
              DefaultInput(
                label: 'Email',
                error: !state.email.valid && state.error != null ? 'Введите почту правильно' : null,
                textInputAction: TextInputAction.next,
                onChanged: (text) {
                  context.read<RegistrationBloc>().add(EmailEvent(email: text));
                },
              ),
              30.emptyHeight,
              DefaultInput(
                label: 'Пароль',
                error: !state.password.valid && state.error != null ? 'Пароль слишком короткий' : null,
                textInputAction: TextInputAction.done,
                onChanged: (text) {
                  context.read<RegistrationBloc>().add(PasswordEvent(password: text));
                },
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildButton() {
    return BlocBuilder<RegistrationBloc, RegistrationState>(
      buildWhen: (prev, cur) => prev.isLoading != cur.isLoading,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90),
          child: BaseButton(
            enable: !state.isLoading,
            color: state.isLoading ? Colors.grey : null,
            text: 'Продолжить',
            onTap: () {
              context.read<RegistrationBloc>().add(SignUpEvent());

            },
          ),
        );
      },
    );
  }
}
