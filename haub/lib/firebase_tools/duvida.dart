import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:haub/firebase_tools/usuario.dart';

class Duvida{
  String _senderId;
  String texto;
  String area;
  String nivel;

  String get idRemetente => _senderId;

  Future<bool> enviar() async {
    FirebaseFirestore.instance.collection('duvidas').doc().set({
      'senderId':Usuario.id,
      'timestamp':Timestamp.now(),
      'texto':texto,
      'area':area,
      'nivel':nivel
    });

    List<String> participantes = new List<String>();
    participantes.add(Usuario.id);
    participantes.add('HfXGZtWGbGVtnhJvrbekwi5HiOC2');

    DocumentReference novaConversa = await FirebaseFirestore.instance
      .collection('conversas')
      .add({
        'firstSender':Usuario.id,
        'participantes':participantes,
        'lastSender':Usuario.nome,
        'lastMessageText':texto,
        'lastTimestamp':Timestamp.now()
      });

    novaConversa.collection('mensagens').add({
      'senderId':Usuario.id,
      'senderName':Usuario.nome,
      'timestamp':Timestamp.now(),
      'texto':texto
    });

    return true;
  }
}