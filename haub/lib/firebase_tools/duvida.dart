class Duvida{
  String _senderId;
  String _duvidaId;
  String _texto;
  String _area;
  String _nivel;

  /*
  (String senderId, String duvidaId) {
    _senderId = senderId;
    _duvidaId = duvidaId;
  }
  */

  String get texto => _texto;
  set texto(texto) => {if (_duvidaId == null) {_texto = texto}};

  String get area => _area;
  set area(area) => {if (_duvidaId == null) {_area = area}};

  String get nivel => _nivel;
  set nivel(nivel) => {if (_duvidaId == null) {_nivel = nivel}};

  String get idRemetente => _senderId;
  String get idDuvida => _duvidaId;
}