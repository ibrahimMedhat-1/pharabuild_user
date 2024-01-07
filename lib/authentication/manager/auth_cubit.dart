import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intelligent_pharmacy/shared/network/cache_keys.dart';
import 'package:intelligent_pharmacy/shared/network/cached_preference.dart';

import '../../user/layout/layout.dart';

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

  void login(BuildContext context) {
    emit(LoginLoading());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: emailAddressController.text.trim(), password: passwordController.text)
        .then((value) {
      Future.wait([
        CacheHelper.setData(key: CacheKeys.userId, value: value.user!.uid),
      ]);
      emit(LoginSuccessfully());
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder) => const Layout()));
    }).catchError((onError) {
      emit(LoginError());
      Fluttertoast.showToast(msg: onError.message.toString());
    });
  }

  void signUp(BuildContext context) {
    emit(CreateUserLoading());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: emailAddressController.text.trim(), password: passwordController.text)
        .then((value) {
      emit(CreateUserSuccessfully());
      Navigator.pop(context);
    }).catchError((onError) {
      emit(CreateUserError());
      Fluttertoast.showToast(msg: onError.message.toString());
    });
  }

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
    obscureSignUp = !obscureSignUp;
    if (obscureSignUp) {
      suffixIconSignUp = Icons.visibility_off;
      emit(ChangeObscure());
    } else {
      suffixIconSignUp = Icons.visibility;
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
