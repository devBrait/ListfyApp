import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listfy_app/presentation/views/auth/register.dart';
import 'package:listfy_app/presentation/views/widgets/primary_button.dart';
import 'package:listfy_app/utils/constants.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _Login();
}

class _Login extends State<Login> {
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Constants.darkPurple, Constants.darkerPurple],
            ),
          ),
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              ),
              child: IntrinsicHeight(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.08,
                    vertical: 20,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Flexible(child: SizedBox(height: 20)),
                      
                      Text(
                        'Log in to Listify!',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: Constants.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 30),
                      
                      PrimaryButton(
                        text: 'Log in with Google',
                        onPressed: () {
                          // Google login
                        },
                        fontSize: 16,
                        height: 50,
                        icon: const FaIcon(
                          FontAwesomeIcons.google,
                          size: 20,
                          color: Constants.white,
                        ),
                      ),
                      
                      const SizedBox(height: 25),
                      
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Constants.white)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or log in with Email',
                              style: TextStyle(color: Constants.white, fontSize: 14),
                            ),
                          ),
                          Expanded(child: Divider(color: Constants.white)),
                        ],
                      ),
                      
                      const SizedBox(height: 25),
                      
                      const SizedBox(height: 6),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter username or email',
                          hintStyle: const TextStyle(color: Constants.lightGray),
                          filled: true,
                          fillColor: Constants.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              // Implement forgot password
                            },
                            child: const Text(
                              'Forgot password?',
                              style: TextStyle(
                                color: Constants.white,
                                fontSize: 14,
                                decoration: TextDecoration.underline,
                                decorationColor: Constants.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),

                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: 'Enter password',
                          hintStyle: const TextStyle(color: Constants.lightGray),
                          filled: true,
                          fillColor: Constants.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(18),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16, 
                          ),
                        ),
                      ),
                      
                      const SizedBox(height: 16),
                      
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: _rememberMe,
                              onChanged: (value) {
                                setState(() {
                                  _rememberMe = value ?? false;
                                });
                              },
                              activeColor: Constants.white,
                              checkColor: Constants.darkPurple,
                              side: const BorderSide(color: Constants.white),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Flexible(
                            child: Text(
                              'Remember me',
                              style: TextStyle(
                                color: Constants.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 30),

                      PrimaryButton(
                        width: double.infinity,
                        height: 50,
                        text: 'Log in',
                        fontSize: 16,
                        onPressed: () {
                          // Implement log in logic
                        }
                      ),
                      
                      const SizedBox(height: 20),
                      
                      Column(
                        children: [
                          const Text(
                            "Don't have an account?",
                            style: TextStyle(
                              color: Constants.lightGray,
                              fontSize: 14,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context, 
                                MaterialPageRoute(
                                  builder: (context) => const Register(),
                                ),
                              );
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(
                                color: Constants.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Constants.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                      
                      // Espaço flexível no final
                      const Flexible(child: SizedBox(height: 20)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}