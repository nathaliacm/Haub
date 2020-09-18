import 'package:flutter/material.dart';
import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'package:haub/view/onboard/cadastro.dart';

class MyLoginPage extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  //final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      appBar: AppBar(
        backgroundColor: ColorPalette.primaryColor,
        centerTitle: true,
        toolbarHeight: 300, 
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/logo-teste.png',
              width: 120,
              height: 120,
            ),
          ],
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 80),
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Column(children: [
                  /*
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(hintText: "E-mail"),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  TextField(
                    controller: _passController,
                    decoration: InputDecoration(hintText: "Senha"),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                  ),*/
                  Center(
                    child:Container(
                      padding: EdgeInsets.all(10),
                      width: (MediaQuery.of(context).size.width),
                      height: 90,
                      child: GoogleSignInButton(
                        borderRadius: 12,
                        text: "Entre com sua conta Google",
                        textStyle: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorPalette.placeHolderTextColor,
                        ),
                        centered: true,
                        onPressed: () async {
                          await Usuario.fazerLogin();
                          if (!await Usuario.jaCadastrado()) {
                            await Usuario
                                .cadastrar(); //Apenas para teste. REMOVER
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MyRegisterPage()));
                          } else {
                            Navigator.pushReplacementNamed(context, '/home');
                          }
                        },
                      ))),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
