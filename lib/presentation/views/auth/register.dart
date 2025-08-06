import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listfy_app/presentation/views/auth/login.dart';
import 'package:listfy_app/presentation/views/widgets/primary_button.dart';
import 'package:listfy_app/utils/constants.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _Register();
}

class _Register extends State<Register> {
  bool _agreeTerms = false;

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
                minHeight: MediaQuery.of(context).size.height - 
                          MediaQuery.of(context).padding.top,
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
                        'Sign up to Listify!',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.07,
                          fontWeight: FontWeight.bold,
                          color: Constants.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                      const SizedBox(height: 20),
                      
                      PrimaryButton(
                        text: 'Sign up with Google',
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
                      
                      const SizedBox(height: 20),
                      
                      const Row(
                        children: [
                          Expanded(child: Divider(color: Constants.white)),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            child: Text(
                              'Or continue with Email',
                              style: TextStyle(color: Constants.white, fontSize: 14),
                            ),
                          ),
                          Expanded(child: Divider(color: Constants.white)),
                        ],
                      ),
                      
                      const SizedBox(height: 20),
                      
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter your name',
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
                      
                      const SizedBox(height: 12),
                      
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Enter username',
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
                      
                      const SizedBox(height: 12),
                      
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'Enter Email',
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
                      
                      const SizedBox(height: 12),
                      
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
                      
                      const SizedBox(height: 12),
                      
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child: Checkbox(
                              value: _agreeTerms,
                              onChanged: (value) {
                                setState(() {
                                  _agreeTerms = value ?? false;
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
                          const Expanded(
                            child: Text(
                              'I agree with the Terms of Service and Privacy policy',
                              style: TextStyle(
                                color: Constants.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 20),

                      PrimaryButton(
                        width: double.infinity,
                        height: 50,
                        text: 'Create Account',
                        fontSize: 16,
                        onPressed: () {
                          // Implement account creation logic
                        }
                      ),

                      const SizedBox(height: 15),

                      Column(
                        children: [
                          const Text(
                            "Already have an account?",
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
                                  builder: (context) => const Login(),
                                ),
                              );
                            },
                            child: const Text(
                              'Login',
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
                      const Flexible(child: SizedBox(height: 2)),
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