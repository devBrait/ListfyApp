import 'package:flutter/material.dart';
import 'package:listfy_app/presentation/views/auth/login.dart';
import 'package:listfy_app/utils/constants.dart';

class LoginPrompt extends StatelessWidget {
  const LoginPrompt({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already have an account? ',
          style: TextStyle(
            color: Constants.lightGray,
            fontSize: 16,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => const Login(),)); 
          },
          child: Text(
            'Login',
            style: TextStyle(
              color: Constants.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              decoration: TextDecoration.underline,
              decorationColor: Constants.white,
            ),
          ),
        ),
      ],
    );
  }
}
