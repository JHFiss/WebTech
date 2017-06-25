import 'koerperform.dart';
import 'koordinaten.dart';
import 'spielModel.dart';

///Klasse Raumschiff die Koerperform erweitert
class Raumschiff extends Koerperform {
  int _laserIDref = 0;

  ///Raumschiff Konstruktor von Raumschiff
  ///Ruft den super Konstruktor von koerperform auf
  Raumschiff(String _farbe, Koordinaten _position, int _id, List<Koordinaten> _form,
              int _damageValue, int _lifeValue, SpielModel _model,
              this._laserIDref)
      : super(_farbe, _position, _id, _form, _damageValue, _lifeValue,
              _model);

  ///Returned die Laser ID referenze
  int get getLaserIDref => this._laserIDref;

  //TODO Implementieren
  @override
  void _setPosition() {

  }

  //TODO zzt Pseudocode, für korrekte Implementierung muessen collisionDetection und setPosition funktionieren
  //TODO Spielergesteuertes Raumschiff, Steuervariablen müssen uebergeben werden
  void onTick() {
    this._setPosition();
  }
}