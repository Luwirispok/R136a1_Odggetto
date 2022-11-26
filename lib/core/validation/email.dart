import 'package:formz/formz.dart';

enum EmailValidError{invalid, empty}

class EmailForm extends FormzInput<String, EmailValidError>{
  EmailForm.dirty([super.value = '']) : super.dirty();

  EmailForm.pure([super.value = '']): super.pure();

  static final _regex = RegExp(
      r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');


  @override
  EmailValidError? validator(String value) {
    if(value.isEmpty){
      return EmailValidError.empty;
    }
    if (!_regex.hasMatch(value)) {
      return EmailValidError.invalid;
    }
    return null;
  }

}