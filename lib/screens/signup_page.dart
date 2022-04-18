import 'package:flutter/material.dart';
import 'package:instagram/screens/signin_page.dart';
import 'package:instagram/services/authentication.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign up"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildTextField("Name", name),
          _buildTextField("Email", email),
          _buildTextField("Password", password),
          MaterialButton(
            child: const Text("Sign up"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: _signUp,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const Text("Already have an account?"),
              MaterialButton(
                child: const Text("Sign in"),
                textColor: Colors.blue,
                onPressed: _signIn,
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

  void _signUp(){
    final authService = Provider.of<AuthService>(context, listen: false);

    authService.createUserWithEmailAndPassword(email.text.trim(), password.text.trim());
  }

  void _signIn(){
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const SignInPage()));
  }
}
