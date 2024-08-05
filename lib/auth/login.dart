import 'package:flutter/material.dart';
import 'package:lofola_app/components/Button.dart';
import 'package:lofola_app/components/TextInput.dart';
import 'package:lofola_app/contants/UserInstance.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          reverse: true,
          child: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 150,
                    ),
                    const Text(
                      'Lofola',
                      style: TextStyle(
                          fontSize: 36,
                          color: Color.fromARGB(255, 61, 97, 206),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Playwrite"),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text("Welcome back, you've been missed",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    const TextInput(
                      hintText: "Input your email or username",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextInput(
                      hintText: "Input your password",
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                      TextButton(
                        onPressed: () {
                          print("Forgot password button pressed");
                        },
                        child: const Text(
                          'Forgot password?',
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ]),
                    const SizedBox(
                      height: 15,
                    ),
                    Button(
                      text: 'Login',
                      onPressed: () async {
                        UserInstance.instance.login("tuanchill2", "ffffffff");
                      },
                      color: Colors.green,
                      textColor: Colors.white,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      borderRadius: 12.0,
                      elevation: 5.0,
                      isMaxWidth: true,
                      paddingInside: const EdgeInsets.symmetric(
                          vertical: 14.0, horizontal: 30.0),
                    ),
                    // register and forgot password
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            print("Register button pressed");
                          },
                          child: const Text(
                            'Register now',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
