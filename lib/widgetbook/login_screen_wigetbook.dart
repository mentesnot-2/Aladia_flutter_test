import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
@widgetbook.UseCase(
  name: 'Login Screen - Default',
  type: LoginScreenWidget,
)
Widget loginScreenDefault(BuildContext context) {
  return const LoginScreenWidget();
}


// Main Login Screen Widget
class LoginScreenWidget extends StatelessWidget {
  const LoginScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController _emailController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const LogoAndWelcomeText(),
                const SizedBox(height: 40),
                EmailInputField(controller: _emailController),
                const SizedBox(height: 20),
                const EnterButton(), // Button will handle the submission
                const SizedBox(height: 20),
                const Row(
                  children: [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text('Or'),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                const SizedBox(height: 20),
                // You can include the social login buttons widget here if needed
                const Text(
                  'Terms & conditions',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Logo and Welcome Text Widget
class LogoAndWelcomeText extends StatelessWidget {
  const LogoAndWelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.topCenter,
      transform: Matrix4.translationValues(0, -20, 0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 15,
              offset: const Offset(0, 5),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        height: 140,
        child: Row(
          children: [
            Flexible(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  'assets/logo.png', // Replace with your logo asset
                  fit: BoxFit.contain,
                  height: double.infinity,
                ),
              ),
            ),
            const SizedBox(width: 60),
            const Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Welcome to Aladia,',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Create or access your account from here',
                    style: TextStyle(fontSize: 14),
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Email Input Field Widget
class EmailInputField extends StatelessWidget {
  final TextEditingController controller;

  const EmailInputField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Enter your email',
            style: TextStyle(fontSize: 18),
          ),
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
      ),
    );
  }
}

// Button Widget for Enter Action
class EnterButton extends StatefulWidget {
  const EnterButton({Key? key}) : super(key: key);

  @override
  _EnterButtonState createState() => _EnterButtonState();
}

class _EnterButtonState extends State<EnterButton> {
  bool _isLoading = false;

  void _submitEmail(String email) async {
    setState(() {
      _isLoading = true;
    });

    // Simulate an API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Handle email submission logic here (e.g., validate the email)
    // For demonstration purposes, we just print a message
    print('Email submitted: $email');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading
            ? null
            : () {
                final email =
                    (context.findAncestorWidgetOfExactType<EmailInputField>()
                            as EmailInputField)
                        .controller
                        .text;
                _submitEmail(email);
              },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : const Text('Enter'),
      ),
    );
  }
}
