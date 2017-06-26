import 'koordinaten.dart';
import 'koerperform.dart';
import 'spielModel.dart';
///Klasse Laser die Koerperform erweitert
class Laser extends Koerperform {

  ///Laser Kontruktor
  ///Ruft den super Konstruktor von Koerperform auf
  Laser(String _farbe, Koordinaten _position, int _id, List<Koordinaten> _form,
        int _damageValue, int _lifeValue, SpielModel _model)
      : super(_farbe, _position, _id, _form, _damageValue, _lifeValue, _model);

  //TODO zzt Pseudocode, für korrekte Implementierung muessen collisionDetection und setPosition funktionieren
  @override
  void onTick(Koordinaten koordinaten) {
    this.collisionDetection();
  }
}