import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intelligent_pharmacy/authentication/view/signup_page.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/auth_button.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/custom_text_form.dart';
import 'package:intelligent_pharmacy/authentication/view/widgets/welcome_widget.dart';

import '../../layout/layout.dart';
import '../manager/auth_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        AuthCubit cubit = AuthCubit.get(context);
        return Scaffold(
          key: cubit.scaffoldKey,
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
                        welcomeText: 'Welcome Back',
                      ),
                      CustomTextForm(
                        controller: cubit.emailAddressController,
                        obscure: false,
                        labelText: 'Email Address',
                        hintText: 'Enter your email here...',
                      ),
                      CustomTextForm(
                        controller: cubit.passwordController,
                        obscure: cubit.obscure,
                        labelText: 'Password',
                        hintText: 'Enter your password here...',
                        suffixIcon: cubit.suffixIcon,
                        suffixPressed: cubit.suffixPressed,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                              onPressed: () {
                                cubit.clearTextFormFields();
                              },
                              child: const Text('Forgot Password?'),
                            ),
                            AuthButton(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context, MaterialPageRoute(builder: (builder) => const Layout()));
                              },
                              text: 'Login',
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(20, 12, 0, 24),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    fontFamily: 'Lexend Deca',
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey,
                                  ),
                            ),
                            TextButton(
                              onPressed: () async {
                                cubit.clearTextFormFields();
                                Navigator.push(context, MaterialPageRoute(builder: (builder) => const SignUp()));
                              },
                              child: const Text('Create Account'),
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
