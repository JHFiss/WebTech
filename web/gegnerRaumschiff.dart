import 'koordinaten.dart';
import 'raumschiff.dart';
//TODO super Konstruktoren fuer die Methoden
///Die Klasse die das Raumschiff erweitert
class GegnerRaumschiff extends Raumschiff{
  List<Koordinaten> _bewegungsmuster = new List<Koordinaten>();
  List<bool> _angriffsmuster = new List<bool>();
  int _bmIterator, _amIterator = 0;

  ///GegnerRaumschiff Konstruktor
  ///Ruft den super Konstruktor von Raumschiff auf
  GegnerRaumschiff(String _farbe, Koordinaten _position, int _geschwindigkeitHorizontal,
      int _geschwindigkeitVertikal, int _id, List<Koordinaten> _form, int _damageValue, int _lifeValue, int _lebenAnzahl, int _laserIDref,
      this._bewegungsmuster, this._angriffsmuster)
      : super(_farbe, _position, _geschwindigkeitHorizontal,
      _geschwindigkeitVertikal, _id, _form, _damageValue, _lifeValue, _lebenAnzahl, _laserIDref);

  ///Returned die naechste Position des gegnerRaumschiffes
  Koordinaten get getNextBewegung => _bewegungsmuster[++_bmIterator];

  ///Returned ob das Raumschiff schießen soll oder nicht
  ///true falls ja, false wenn nicht
  bool get getNextSchuss => _angriffsmuster[++_amIterator];

  //TODO Implementieren
  @override
  void _setPosition() {

  }
}