// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:trabalho_flutter/pages/login/LoginPage.dart';

class Sobre extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sobre",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black38,
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            Text(
              "Quem nós somos?",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Este aplicativo foi desenvolvido para aula de Programação de dispositivos móveis, ministrada pelo Dr. Professor Plotze, pelos discentes Douglas e Lucas do quarto semestre de ADS. \n\n\n Este aplicativo foi desenvolvido em Flutter no Visual Studio Code com o objetivo de ser uma ponte facilitadora de agendamentos de serviços estéticos de uma barbearia.",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/douglas.png"),
            ),
            Center(
              child: Text(
                "Douglas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/lucas.jpg"),
            ),
            Center(
              child: Text(
                "Lucas",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
