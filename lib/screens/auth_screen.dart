import 'package:flutter/material.dart';
import 'package:flutterfire_authen/screens/login_screen.dart';
import 'package:flutterfire_authen/screens/registration.dart';
import 'package:flutterfire_authen/widgets/reusables.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.fingerprint_outlined,
            size: 100,
          ),
          const SizedBox(height: 10),
          const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('FRUZZ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w900)),
            Text('digital', style: TextStyle(fontSize: 24)),
          ]),
          const SizedBox(height: 40),
          ReusableButton(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (ctx) => LoginScreen()));
            },
            btnColor: Colors.blue,
            btnName: 'Login',
            borderColor: Colors.blue,
            color: Colors.black54,
          ),
          const SizedBox(height: 20),
          ReusableButton(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (ctx) => RegistrationScreen()));
            },
            btnName: 'Sign Up',
            color: Colors.black54,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {},
            child: const Text('Login as guest',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    ));
  }
}
