import 'package:formz/formz.dart';

enum PasswordConfirmValidError{tooShort, notMatch}

class PasswordConfirmForm extends FormzInput<String, PasswordConfirmValidError>{
  PasswordConfirmForm.dirty([super.value = '', this.passwordToCompare]) : super.dirty();

  PasswordConfirmForm.pure([super.value = '', this.passwordToCompare]): super.pure();

  final String? passwordToCompare;

  @override
  PasswordConfirmValidError? validator(String value) {
    if(value.length < 4){
      return PasswordConfirmValidError.tooShort;
    }
    if(passwordToCompare != null && passwordToCompare != value){
      return PasswordConfirmValidError.notMatch;
    }
    return null;
  }

}