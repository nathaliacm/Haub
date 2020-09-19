import 'package:flutter/material.dart';
import 'package:haub/firebase_tools/conversa.dart';
import 'package:haub/firebase_tools/usuario.dart';
import 'package:haub/models/colorPalette.dart';
import 'text_composer.dart';
import 'constants.dart';

class MyChatPage extends StatefulWidget {
  final Conversa conversaAtual;
  Stream<List<Mensagem>> msgStream;

  MyChatPage(this.conversaAtual, {Key key}) : super(key: key);

  @override
  _MyChatPageState createState() => _MyChatPageState();
}

class _MyChatPageState extends State<MyChatPage> {
  Color colorBalloon = ColorPalette.chatSenderColor;

  void _sendMessage(String text) {
    widget.conversaAtual.enviarMensagem(text);
  }

  @override
  void initState() {
    widget.msgStream = widget.conversaAtual.novasMensagens();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: ColorPalette.primaryColor,
          title: Text(widget.conversaAtual.nomeDoChat),
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
                      stream: widget.msgStream,
                      builder: (context, ultimasMensagens) {
                        switch (ultimasMensagens.connectionState) {
                          case ConnectionState.none:
                          case ConnectionState.waiting:
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          default:
                            if(ultimasMensagens.data==null) {return Center(child: CircularProgressIndicator());}
                            return ListView.builder(
                              itemCount: ultimasMensagens.data.length,
                              reverse: true,
                              itemBuilder: (context, index) {
                                return Container(
                                  margin: chooseSide(ultimasMensagens.data[index]),
                                  child: Ink(
                                    decoration: ShapeDecoration(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(20.0)
                                        )
                                      ),
                                      color: this.colorBalloon,
                                    ),
                                    child: Column(
                                      children: [
                                        ListTile(
                                          title: Text(ultimasMensagens.data[index].texto),
                                        ),
                                      ]
                                    ),
                                  )
                                );
                              }
                            );
                        }
                      }
                    )
                  ),
                Center(
                  child:Material(
                    elevation:1,
                    child:Container(
                      padding:EdgeInsets.fromLTRB(5,10,5,7),
                      child: Ink(
                        padding:EdgeInsets.only(left:15),
                        decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                  BorderRadius.all(Radius.circular(24))
                            ),
                            color: ColorPalette.primaryColor),
                        child: TextComposer(_sendMessage)
                      )
                    )
                ))
            ])));
  }

  EdgeInsetsGeometry chooseSide(Mensagem mensagem) {
    if (Usuario.isMine(mensagem)) {
      this.colorBalloon = ColorPalette.chatSenderColor;
      return EdgeInsets.fromLTRB(120, 0, 10, 10);
    } else {
      this.colorBalloon = ColorPalette.chatReceivedColor;
      return EdgeInsets.fromLTRB(10, 0, 120, 10);
    }
  }
}

void choiceAction(String choice) {
  print('WORKING');
}