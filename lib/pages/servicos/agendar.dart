import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trabalho_flutter/pages/servicos/profissionais.dart';
import 'package:trabalho_flutter/pages/servicos/servicos.dart';
import 'package:trabalho_flutter/pages/widgets/mensagem.dart';

class agendar extends StatelessWidget {
  agendar({Key? key}) : super(key: key);

  var txtServico = TextEditingController();
  var txtData = TextEditingController();

  retornarDocumentoById(id) async {
    await FirebaseFirestore.instance
        .collection('agendamentos')
        .doc(id)
        .get()
        .then((doc) {
      txtServico.text = doc.get('serviços');
      txtData.text = doc.get('data');
    });
  }

  @override
  Widget build(BuildContext context) {
    var id = ModalRoute.of(context)!.settings.arguments;
    if (id != null) {
      if (txtServico.text.isEmpty && txtData.text.isEmpty) {
        retornarDocumentoById(id);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Agendar",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(50),
        child: ListView(
          children: [
            campoTexto('Serviços', txtServico, Icons.room_service),
            const SizedBox(height: 20),
            campoTexto('Data', txtData, Icons.calendar_month),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.black,
                    ),
                    child: const Text('salvar'),
                    onPressed: () {
                      if (id == null) {
                        //
                        //Adicionar um novo doumento
                        //
                        FirebaseFirestore.instance
                            .collection('agendamentos')
                            .add({
                          "uid": FirebaseAuth.instance.currentUser!.uid,
                          "nome": txtServico.text,
                          "data": txtData.text,
                        });
                        sucesso(context, 'Item adicionado com sucesso.');
                      } else {
                        FirebaseFirestore.instance
                            .collection('agendamentos')
                            .doc(id.toString())
                            .set({
                          "nome": txtServico.text,
                          "data": txtData.text,
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                SizedBox(
                  width: 150,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        primary: Colors.black,
                      ),
                      child: const Text('cancelar'),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  campoTexto(texto, controller, icone, {senha}) {
    return TextField(
      controller: controller,
      obscureText: senha != null ? true : false,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icone, color: Colors.black),
        prefixIconColor: Colors.black,
        labelText: texto,
        labelStyle: const TextStyle(color: Colors.black),
        border: const OutlineInputBorder(),
        focusColor: Colors.black12,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black12,
            width: 0.0,
          ),
        ),
      ),
    );
  }
}
