import 'package:flutter/material.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
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
                'assets/google.png', 
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
                'assets/facebook.png', 
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
                'assets/apple.png', 
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
      ],
    );
  }
}
