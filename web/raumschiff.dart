import 'koerperform.dart';
import 'koordinaten.dart';

///Klasse Raumschiff die Koerperform erweitert
class Raumschiff extends Koerperform {
  int _Leben = 1;
  int _laserIDref = 0;

  ///Raumschiff Konstruktor von Raumschiff
  ///Ruft den super Konstruktor von koerperform auf
  Raumschiff(String _farbe, Koordinaten _position, int _gH,
      int _gV, int _id, List<Koordinaten> _form, this._Leben , this._laserIDref)
      : super(_farbe, _position, _gH, _gV, _id, _form);

  ///Returned die anzahl der restlichen Leben
  int get getLife => this._Leben;

  ///Dekrementiert die anzahl der leben wenn true
  ///Inkrementiert die Leben wenn false
  ///Returned true wenn keine Leben mehr verfügbar sind
  bool updateLife(bool removeLife) {
    removeLife ? this._Leben-- : this._Leben++;
    return _Leben == 0;
  }

  ///Returned die Laser ID referenze
  int get getLaserIDref => this._laserIDref;

}