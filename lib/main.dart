import 'package:flutter/material.dart';
import 'package:trabalho_flutter/pages/cadastro/SignUpPage.dart';
import 'package:trabalho_flutter/pages/home/home.dart';
import 'package:trabalho_flutter/pages/login/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Barber Shop',
      initialRoute: 'login',
      routes: {
        'login': (context) =>  LoginPage(),
        'criar_conta': (context) => CriarContaPage(),
        'principal': (context) => home(),
        
      },
    ),
  );
}
