import 'koordinaten.dart';
import 'koerperform.dart';

///Klasse Laser die Koerperform erweitert
class Laser extends Koerperform {

  ///Laser Kontruktor
  ///Ruft den super Konstruktor von Koerperform auf
  Laser(String _farbe, Koordinaten _position, int _geschwindigkeitHorizontal,
      int _geschwindigkeitVertikal, int _id, List<Koordinaten> _form, int _damageValue, int _lifeValue, int _lebenAnzahl)
      : super(_farbe, _position, _geschwindigkeitHorizontal,
      _geschwindigkeitVertikal, _id, _form, _damageValue, _lifeValue, _lebenAnzahl);

  //TODO Implementieren
  @override
  void _setPosition() {

  }
}