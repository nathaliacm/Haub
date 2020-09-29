import 'package:flutter/material.dart';
import 'package:haub/models/appBar.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/models/dropDownButtonElement.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({Key key}) : super(key: key);

  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  final TextEditingController _mytextController = TextEditingController();
  bool _edit = false;

  String selecionadoEscolaridade;
  String selecionadoAreadeDominio;
  String selecionadoNiveldeDominio;

  String escolaridade;
  String areadeDominio;
  String niveldeDominio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CircularAppBar('Configuração', 120, true, 25),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: !_edit ? Icon(Icons.edit) : Icon(Icons.check_circle),
                    color: ColorPalette.secondaryColor,
                    onPressed: () {
                      setState(() {
                        _edit = !_edit;
                      });
                    },
                  ),
                ],
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.photo,
                        size: 80,
                      ),
                    ],
                  )),
              Container(
                padding: EdgeInsets.all(10),
                height: 70,
                width: 360,
                child: TextFormField(
                  enabled: _edit,
                  controller: _mytextController,
                  focusNode: FocusNode(canRequestFocus: false),
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: !_edit ? "<nome usuario>" : "Seu nome",
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelStyle: TextStyle(color: ColorPalette.textColor),
                    filled: true,
                    fillColor: Colors.grey[300],
                  ),
                ),
              ),
              Text(
                "Escolaridade",
                style: TextStyle(fontSize: 15),
              ),
              DropDownButtomOnly(
                  ["Ensino médio", "Ensino Superior", "Mestrado", "Doutorado"],
                  escolaridade,
                  (String selecao) => selecao = selecionadoEscolaridade,
                  _edit,
                  "<Sua escolaridade>"),
              Text(
                "Área de domínio",
                style: TextStyle(fontSize: 15),
              ),
              DropDownButtomOnly(
                  ["Fisica", "Matematica", "ingles", "Historia"],
                  areadeDominio,
                  (String selecao) => selecao = selecionadoAreadeDominio,
                  _edit,
                  "<Sua área de domínio>"),
              DropDownButtomOnly(
                  ["Ensino médio", "Ensino Superior", "Mestrado", "Doutorado"],
                  niveldeDominio,
                  (String selecao) => selecao = selecionadoNiveldeDominio,
                  _edit,
                  "<Seu nível de domínio>"),
            ],
          ),
        ),
      ),
    );
  }
}
