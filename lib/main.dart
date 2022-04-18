import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:instagram/screens/widgets/wrapper.dart';
import 'package:instagram/services/authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => AuthService(),
      child: const MaterialApp(
        title: 'Instagram',
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

