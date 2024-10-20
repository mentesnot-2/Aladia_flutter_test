import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart' as widgetbook;
import 'package:aladia_login/presentation/screens/password_screen.dart'; // Adjust the import as needed

@widgetbook.UseCase(
  name: 'Password Screen - Default',
  type: PasswordScreen,
)
Widget passwordScreenDefault(BuildContext context) {
  // Provide a sample email for the PasswordScreen
  return PasswordScreen(email: 'test@example.com');
}

@widgetbook.UseCase(
  name: 'Password Field - Default',
  type: PasswordScreen,
)
Widget passwordFieldDefault(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    appBar: AppBar(
      title: const Text(
        'Password Field Preview',
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        color: Colors.black,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    body: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Password Field Preview',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            // Password Field with visibility toggle
            PasswordFieldWidget(),
            const SizedBox(height: 20),
            PasswordSubmitButton(), // Use a separate widget for the button
          ],
        ),
      ),
    ),
  );
}

// Password Field Widget
class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({Key? key}) : super(key: key);

  @override
  _PasswordFieldWidgetState createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  bool _isPasswordVisible = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _passwordController,
      obscureText: !_isPasswordVisible,
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: const Icon(Icons.key, color: Colors.grey),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
      ),
    );
  }
}

// Button Widget with Loading Indicator
class PasswordSubmitButton extends StatefulWidget {
  const PasswordSubmitButton({Key? key}) : super(key: key);

  @override
  _PasswordSubmitButtonState createState() => _PasswordSubmitButtonState();
}

class _PasswordSubmitButtonState extends State<PasswordSubmitButton> {
  bool _isLoading = false;

  void _submitPassword() async {
    setState(() {
      _isLoading = true;
    });

    // Simulate an API call
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    // Handle password submission logic here (e.g., validate the password)
    // For demonstration purposes, we just print a message
    print('Password submitted!');
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: _isLoading ? null : _submitPassword,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: _isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 2,
              )
            : const Text('Enter'),
      ),
    );
  }
}
