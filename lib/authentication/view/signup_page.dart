import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/auth_button.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/custom_text_form.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/welcome_widget.dart';

import '../manager/auth_cubit.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    blurRadius: 7,
                    color: Color(0x4D090F13),
                    offset: Offset(0, 3),
                  )
                ],
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(16),
                  left: Radius.circular(16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const WelcomeWidget(
                        welcomeText: 'Get Started Below',
                      ),
                      CustomTextForm(
                        controller: cubit.emailAddressSignUpController,
                        obscure: false,
                        labelText: 'Email Address',
                        hintText: 'Enter your email here...',
                      ),
                      CustomTextForm(
                        controller: cubit.passwordSignUpController,
                        obscure: cubit.obscureSignUp,
                        labelText: 'Password',
                        hintText: 'Enter your password here...',
                        suffixIcon: cubit.suffixIconSignUp,
                        suffixPressed: cubit.suffixPressedSignUp,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: state is CreateUserLoading
                            ? const CircularProgressIndicator()
                            : AuthButton(
                                onTap: () {
                                  cubit.signUp(context);
                                },
                                text: 'Create Account',
                              ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 0, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: textTheme.bodyMedium!.copyWith(
                                fontFamily: 'Lexend Deca',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey,
                              ),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context);
                              },
                              child: const Text('Login'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
