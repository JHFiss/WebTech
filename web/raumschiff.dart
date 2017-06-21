import 'koerperform.dart';
import 'koordinaten.dart';

///Klasse Raumschiff die Koerperform erweitert
class Raumschiff extends Koerperform {
  int _laserIDref = 0;

  ///Raumschiff Konstruktor von Raumschiff
  ///Ruft den super Konstruktor von koerperform auf
  Raumschiff(String _farbe, Koordinaten _position, int _geschwindigkeitHorizontal,
      int _geschwindigkeitVertikal, int _id, List<Koordinaten> _form, int _damageValue, int _lifeValue, int _lebenAnzahl, this._laserIDref)
      : super(_farbe, _position, _geschwindigkeitHorizontal,
      _geschwindigkeitVertikal, _id, _form, _damageValue, _lifeValue, _lebenAnzahl);

  ///Returned die Laser ID referenze
  int get getLaserIDref => this._laserIDref;

  //TODO updatePosÜberschreiben ???
}