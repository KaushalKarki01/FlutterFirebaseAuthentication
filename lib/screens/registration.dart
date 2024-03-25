import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_authen/screens/login_screen.dart';
import 'package:flutterfire_authen/widgets/form.dart';
import 'package:flutterfire_authen/widgets/reusables.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final toastMessage = ToastMessage();
  bool hidden = true;

//USER REGISTRATION
  Future registerUser(String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      final UserCredential credential = await auth
          .createUserWithEmailAndPassword(email: email, password: password);
      toastMessage.showMessage('Successfully registered');
      return credential;
    } on FirebaseAuthException catch (e) {
      toastMessage.showMessage(e.code.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Text(
          'Register to get started',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 40),
        ReusableForm(
          controller: _emailController,
          hintText: 'Email',
          isHidden: false,
          icon: Icons.email_outlined,
          iconPressed: () {},
        ),
        const SizedBox(height: 20),
        ReusableForm(
          controller: _passwordController,
          hintText: 'Password',
          isHidden: hidden,
          icon: hidden ? Icons.visibility_off_outlined : Icons.remove_red_eye,
          iconPressed: () {
            setState(() {
              hidden = !hidden;
            });
          },
        ),
        const SizedBox(height: 20),
        ReusableForm(
          controller: _confirmPasswordController,
          hintText: 'Confirm Password',
          isHidden: hidden,
          icon: hidden ? Icons.visibility_off_outlined : Icons.remove_red_eye,
          iconPressed: () {
            setState(() {
              hidden = !hidden;
            });
          },
        ),
        const SizedBox(height: 40),
        ReusableButton(
            onTap: () {
              if (_emailController.text.isEmpty ||
                  _passwordController.text.isEmpty ||
                  _confirmPasswordController.text.isEmpty) {
                toastMessage.showMessage('Enter required fields');
              } else if (_passwordController.text.toString() !=
                  _confirmPasswordController.text.toString()) {
                toastMessage.showMessage('Passwords do not match');
              } else {
                registerUser(_emailController.text.toString().toLowerCase(),
                    _passwordController.text.toString());
              }
            },
            btnName: 'Register',
            color: Colors.black),
        const SizedBox(height: 20),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Already have an account?'),
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: const Text('Login'),
          )
        ])
      ]),
    )));
  }
}
