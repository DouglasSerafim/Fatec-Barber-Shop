// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:trabalho_flutter/pages/login/LoginPage.dart';
import 'package:trabalho_flutter/pages/perfil/perfil.dart';
import 'package:trabalho_flutter/pages/servicos/agendar.dart';
import 'package:trabalho_flutter/pages/servicos/meusAgendamentos.dart';
import 'package:trabalho_flutter/pages/servicos/profissionais.dart';
import 'package:trabalho_flutter/pages/servicos/servicos.dart';
import 'package:trabalho_flutter/pages/sobre/Sobre.dart';

class home extends StatelessWidget {



  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            SizedBox(
              width: 128,
              height: 128,
              child: Image.asset("assets/logo.png"),
            ),
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.asset("assets/plotze.jpg"),
                ),
              ),
              accountName: Text(
                'Olá, Plotze',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              accountEmail: Text('plotze@fatecrp.gov.br'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              subtitle: Text('Admire a sua barba!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => perfil(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.people_outline_sharp),
              title: Text('Profissionais'),
              subtitle: Text('Os nossos mestres da barba!'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => profissionais(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work_rounded),
              title: Text('Serviços'),
              subtitle: Text('Aqui você escolhe o que fazemos de melhor'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => servicos(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_view_month),
              title: Text('Agendar Serviços'),
              subtitle: Text('Vamos dar aquele trato?'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => agendar(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.calendar_month),
              title: Text('Meus Agendamentos'),
              subtitle: Text('Não esquece o dia, ok?'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PrincipalPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Sobre'),
              subtitle: Text('Quem nós somos'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Sobre(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.outbond),
              title: Text('Sair'),
              subtitle: Text('Volte Sempre :)'),
              onTap: () => showDialog<String>(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Saindo...'),
                  content: const Text('Você realmente deseja sair?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Não'),
                      child: const Text('Não'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      ),
                      child: const Text('Sim'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('Home'),
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
              "Olá Plotze,",
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
              "Bem vindo ao Barber Shop, aqui você podera conhecer os nossos profissionais, fazer agendamentos e consultar seus horarios agendados.\n\n\nClique no menu lateral e conheça todas as nossas funções.",
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
              height: 328,
              child: Image.asset("assets/barber.gif"),
            ),
          ],
        ),
      ),
    );
  }
}
