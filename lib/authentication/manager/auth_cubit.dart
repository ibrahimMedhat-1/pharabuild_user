import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  static AuthCubit get(context) => BlocProvider.of(context);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController emailAddressSignUpController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordSignUpController = TextEditingController();

  bool obscure = true;
  bool obscureSignUp = true;
  IconData suffixIcon = Icons.visibility_off;
  IconData suffixIconSignUp = Icons.visibility_off;
  void suffixPressed() {
    obscure = !obscure;
    if (obscure) {
      suffixIcon = Icons.visibility_off;
      emit(ChangeObscure());
    } else {
      suffixIcon = Icons.visibility;
      emit(ChangeObscure());
    }
  }

  void suffixPressedSignUp() {
    obscure = !obscure;
    if (obscure) {
      suffixIcon = Icons.visibility_off;
      emit(ChangeObscure());
    } else {
      suffixIcon = Icons.visibility;
      emit(ChangeObscure());
    }
  }

  void clearTextFormFields() {
    emailAddressController.text = '';
    emailAddressSignUpController.text = '';
    passwordController.text = '';
    passwordSignUpController.text = '';
    emit(ClearAllTextFormFields());
  }
}
