import 'koordinaten.dart';
import 'koerperform.dart';

///Klasse Laser die Koerperform erweitert
class Laser extends Koerperform {

  ///Laser Kontruktor
  ///Ruft den super Konstruktor von Koerperform auf
  Laser(String _farbe, Koordinaten _position, int _gH,
      int _gV, int _id, List<Koordinaten> _form)
      : super(_farbe, _position, _gH, _gV, _id, _form);

}