// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_flutter/pages/home/home.dart';
import 'package:trabalho_flutter/pages/servicos/profissionais.dart';
import 'package:trabalho_flutter/pages/widgets/mensagem.dart';


class PrincipalPage extends StatefulWidget {
  const PrincipalPage({Key? key}) : super(key: key);
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  var agendamentos;

  @override
  void initState() {
    super.initState();
    agendamentos = FirebaseFirestore.instance
        .collection('agendamentos')
        .where('uid', isEqualTo: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(50),
        child: StreamBuilder<QuerySnapshot>(
          stream: agendamentos.snapshots(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: Text('Não foi possível conectar.'));
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              default:
                final dados = snapshot.requireData;
                return ListView.builder(
                  itemCount: dados.size,
                  itemBuilder: (context, index) {
                    return exibirDocumento(dados.docs[index]);
                  },
                );
            }
          },
        ),
      ),
    );
  }

  exibirDocumento(item) {
    String nome = item.data()['nome'];
    String preco = item.data()['preco'];
    return ListTile(
      title: Text(nome),
      subtitle: Text(preco),
      //
      // REMOVER UM DOCUMENTO
      //
      trailing: IconButton(
        icon: const Icon(Icons.delete_outline),
        onPressed: () {
          agendamentos.doc(item.id).delete();
          sucesso(context, 'Item removido com sucesso.');
        },
      ),

      onTap: () {
        Navigator.pushNamed(
          context,
          'inserir',
          arguments: item.id,
        );
      },
    );
  }
}
