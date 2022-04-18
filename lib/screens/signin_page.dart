import 'package:flutter/material.dart';
import 'package:instagram/screens/signup_page.dart';
import 'package:provider/provider.dart';

import '../services/authentication.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextField("Email", email),
          _buildTextField("Password", password),
          MaterialButton(
            child: const Text("Sign in"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _signIn,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Don't have an account?"),
              MaterialButton(
                child: const Text("Sign up"),
                textColor: Colors.blue,
                onPressed: _signUp,
              ),
              // const SizedBox(width: 10,)
            ],
          )
        ],
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller){
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            border: const OutlineInputBorder()
        ),
      ),
    );
  }

  void _signIn(){
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.signInWithEmailAndPassword(email.text.trim(), password.text.trim());
  }

  void _signUp(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SignUpPage()));
  }

}
