import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lofola_app/components/Button.dart';
import 'package:lofola_app/components/TextInput.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
                  height: 50,
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
                const SizedBox(
                  height: 45,
                ),
                Button(
                  text: 'Login',
                  onPressed: () {
                    print("Login button pressed");
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
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        print("Register button pressed");
                      },
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
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
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
