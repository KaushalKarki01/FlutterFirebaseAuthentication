import 'package:flutter/material.dart';
import 'package:flutterfire_authen/widgets/form.dart';
import 'package:flutterfire_authen/widgets/reusables.dart';

class PasswordResetScreen extends StatefulWidget {
  const PasswordResetScreen({super.key});

  @override
  State<PasswordResetScreen> createState() => _PasswordResetScreenState();
}

class _PasswordResetScreenState extends State<PasswordResetScreen> {
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Forget Password?',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text('Enter your registered email to verify your account.'),
        const SizedBox(height: 20),
        ReusableForm(
          controller: _emailController,
          hintText: 'Email',
          isHidden: false,
          icon: Icons.email_outlined,
          iconPressed: () {},
        ),
        const SizedBox(height: 40),
        ReusableButton(
          onTap: () {},
          btnName: 'Verify',
          color: Colors.white,
          btnColor: Colors.black,
        )
      ]),
    )));
  }
}
