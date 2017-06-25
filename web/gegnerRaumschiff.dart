import 'koordinaten.dart';
import 'raumschiff.dart';
import 'spielModel.dart';

//TODO super Konstruktoren fuer die Methoden
///Die Klasse die das Raumschiff erweitert
class GegnerRaumschiff extends Raumschiff{
  List<Koordinaten> _bewegungsmuster = new List<Koordinaten>();
  List<bool> _angriffsmuster = new List<bool>();
  int _bmIterator, _amIterator = 0;
  ///GegnerRaumschiff Konstruktor
  ///Ruft den super Konstruktor von Raumschiff auf
  GegnerRaumschiff(String _farbe, Koordinaten _position, int _id,
      List<Koordinaten> _form, int _damageValue, int _lifeValue,
      SpielModel _model, int _laserIDref,
      this._bewegungsmuster, this._angriffsmuster)
      : super(_farbe, _position, _id, _form, _damageValue, _lifeValue,
                _model, _laserIDref);

  ///Returned die naechste Position des gegnerRaumschiffes
  //TODO noch sinnvoll? Raumschiff bewegt sich selbst
  Koordinaten get getNextBewegung => _bewegungsmuster[++_bmIterator];

  ///Returned ob das Raumschiff schießen soll oder nicht
  ///true falls ja, false wenn nicht
  //TODO noch sinnvoll? Raumschiff schiesst selbst
  bool get getNextSchuss => _angriffsmuster[++_amIterator];

  //TODO Implementieren
  @override
  void setPosition() {

  }

  //TODO zzt Pseudocode, für korrekte Implementierung muessen collisionDetection und setPosition funktionieren
  @override
  void onTick(Koordinaten koordinaten) {
    this.setPosition();
  }
}