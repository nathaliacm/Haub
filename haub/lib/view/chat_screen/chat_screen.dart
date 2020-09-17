import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/conversa.dart';
import 'package:haub/models/colorPalette.dart';
import 'text_composer.dart';
import 'constants.dart';

class MyChatPage extends StatelessWidget {
  final Conversa conversaAtual;
  
  MyChatPage(this.conversaAtual, {Key key}) : super(key: key);

  void _sendMessage(String text) {
    conversaAtual.enviarMensagem(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          title: const Text('Haub chat'),
          actions: <Widget>[
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return Constants.choices.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            )
          ],
        ),
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
              Expanded(
                child: StreamBuilder<List<Mensagem>>(
                  stream: conversaAtual.novasMensagens(),
                  builder: (context, ultimasMensagens) {
                    switch (ultimasMensagens.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      default:
                        return ListView.builder(
                            itemCount: ultimasMensagens.data.length,
                            reverse: true,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Text(ultimasMensagens.data[index].texto),
                              );
                            });
                    }
                  },
                ),
              ),
              Center(
                  child: Ink(
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                          color: ColorPalette.primaryColor),
                      child: TextComposer(_sendMessage)))
            ])));
  }
}

void choiceAction(String choice) {
  print('WORKING');
}
