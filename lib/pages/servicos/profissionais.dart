// ignore_for_file: override_on_non_overriding_member

import 'dart:ui';

import 'package:flutter/material.dart';

class profissionais extends StatelessWidget {
  const profissionais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profissionais",
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
              "Conheça os nossos barbeiros!",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 60,
            ),
            ListTile(
              leading: Image.asset("assets/lucas.jpg"),
              title: Text('Lucas'),
              subtitle: Text('Barbeiro 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profissionais(),
                  ),
                );
              },
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              leading: Image.asset("assets/douglas.png"),
              title: Text('Douglas'),
              subtitle: Text('Barbeiro 1'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profissionais(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
