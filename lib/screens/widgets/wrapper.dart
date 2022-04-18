import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/home_page.dart';
import 'package:instagram/screens/signin_page.dart';
import 'package:instagram/services/authentication.dart';
import 'package:provider/provider.dart';
import '../../models/user.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return StreamBuilder<User?>(
        stream: authService.user,
        builder: (_, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            final User? user = snapshot.data;
            return user == null ? const SignInPage() : const HomePage();
          }else{
            return const Scaffold(body: Center(child: CircularProgressIndicator.adaptive()),);
          }
        });
  }
}
