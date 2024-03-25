import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_authen/screens/home_screen.dart';
import 'package:flutterfire_authen/screens/registration.dart';
import 'package:flutterfire_authen/widgets/form.dart';
import 'package:flutterfire_authen/widgets/reusables.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //FORM CONTROLLERS
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  //TOAST MESSAGE
  final toastMessage = ToastMessage();

  //hidden text
  bool hidden = true;

  Future loginUser(String email, String password) async {
    final auth = FirebaseAuth.instance;
    try {
      final UserCredential credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      toastMessage.showMessage('Logging in');
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('Welcome Back!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          const SizedBox(height: 20),
          ReusableForm(
            controller: _emailController,
            hintText: 'Email',
            isHidden: false,
            icon: Icons.email_outlined,
            iconPressed: () {},
          ),
          const SizedBox(height: 10),
          ReusableForm(
            controller: _passwordController,
            hintText: 'Password',
            isHidden: hidden,
            icon: hidden
                ? Icons.remove_red_eye_outlined
                : Icons.visibility_off_outlined,
            iconPressed: () {
              setState(() {
                hidden = !hidden;
              });
            },
          ),
          const SizedBox(height: 20),
          TextButton(
              onPressed: () {},
              child: const Align(
                  alignment: Alignment.topRight,
                  child: Text('Forget Password?'))),
          const SizedBox(height: 40),
          ReusableButton(
            onTap: () {
              loginUser(_emailController.text.toString(),
                      _passwordController.text.toString())
                  .then((value) => Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen())));
            },
            btnName: 'Login',
            btnColor: Colors.black,
            color: Colors.white,
          ),
          const SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text("Dont't have an account?"),
            TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistrationScreen()));
                },
                child: const Text('Register')),
          ])
        ]),
      ),
    ));
  }
}
