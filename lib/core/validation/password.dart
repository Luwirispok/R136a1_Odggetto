import 'package:formz/formz.dart';

enum PasswordValidError{tooShort}

class PasswordForm extends FormzInput<String, PasswordValidError>{
  PasswordForm.dirty([super.value = '']) : super.dirty();

  PasswordForm.pure([super.value = '']): super.pure();

  @override
  PasswordValidError? validator(String value) {
    if(value.length < 6){
      return PasswordValidError.tooShort;
    }
    return null;
  }

}