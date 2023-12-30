import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../manager/auth_cubit.dart';

// ignore: must_be_immutable
class CustomTextForm extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final String hintText;
  IconData? suffixIcon;
  Function()? suffixPressed;
  final bool obscure;

  CustomTextForm({
    super.key,
    required this.controller,
    required this.obscure,
    required this.labelText,
    required this.hintText,
    this.suffixIcon,
    this.suffixPressed,
  });

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ChangeObscure) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: TextFormField(
                  controller: widget.controller,
                  obscureText: widget.obscure,
                  decoration: InputDecoration(
                    labelText: widget.labelText,
                    labelStyle: textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
                    hintText: widget.hintText,
                    hintStyle: textTheme.bodyMedium!.copyWith(
                      color: Colors.grey,
                    ),
                    suffixIcon: widget.suffixIcon == null
                        ? null
                        : IconButton(
                            onPressed: () {
                              widget.suffixPressed!();
                            },
                            icon: Icon(
                              widget.suffixIcon,
                              color: Colors.grey,
                            ),
                          ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x6095A1AC),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0x00000000),
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
                  ),
                  style: textTheme.titleSmall,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
