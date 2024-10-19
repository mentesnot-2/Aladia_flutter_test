import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc.dart';
import '../../core/utils/validators.dart';

class FormWidgets {
  static Widget logoWidget() {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Image.asset(
        'assets/logo.png', // Replace with your logo asset
        fit: BoxFit.contain,
        height: 140,
      ),
    );
  }

  static Widget emailInputField(TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('Enter your email', style: TextStyle(fontSize: 18)),
        const SizedBox(height: 10),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.circular(8),
          ),
          child: TextField(
            controller: controller,
            decoration: const InputDecoration(
              icon: Icon(Icons.email),
              hintText: 'E-mail',
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  static Widget loginButton(BuildContext context, TextEditingController controller, AuthState state) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (Validators.validateEmail(controller.text) == null) {
            context.read<AuthBloc>().add(CheckUserEvent(controller.text));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Invalid email address')),
            );
          }
        },
        child: const Text('Login'),
      ),
    );
  }

  static Widget socialLoginButtons() {
    return Column(
      children: [
        const Text('Or login with'),
        const SizedBox(height: 20),

        // Google Sign In Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              icon: Image.asset(
                'assets/google.png', // Replace with your Google icon asset
                height: 24,
                width: 24,
              ),
              onPressed: () {
                // Handle Google login here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              label: const Text('Sign in with Google'),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Facebook Sign In Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              icon: Image.asset(
                'assets/facebook.png', // Replace with your Facebook icon asset
                height: 24,
                width: 24,
              ),
              onPressed: () {
                // Handle Facebook login here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              label: const Text('Sign in with Facebook'),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // Apple Sign In Button
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              icon: Image.asset(
                'assets/apple.png', // Replace with your Apple icon asset
                height: 24,
                width: 24,
              ),
              onPressed: () {
                // Handle Apple login here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              label: const Text('Sign in with Apple'),
            ),
          ),
        ),
        const SizedBox(height: 20),

        // // Terms & Conditions
        // const Text(
        //   'Terms & conditions',
        //   style: TextStyle(decoration: TextDecoration.underline),
        // ),
      ],
    );
  }
}
