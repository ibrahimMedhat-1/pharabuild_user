import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final Function() onTap;
  final String text;
  const AuthButton({
    super.key,
    required this.onTap(),
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: MaterialButton(
        onPressed: () async {
          onTap();
        },
        minWidth: MediaQuery.of(context).size.width * 0.35,
        height: MediaQuery.of(context).size.width * 0.13,
        elevation: 3,
        color: Colors.blueAccent,
        textColor: Colors.white,
        child: Text(text),
      ),
    );
  }
}
