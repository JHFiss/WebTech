import 'koordinaten.dart';

///Die Abstrakte Klasse Koerperform von der sich laser und
///raumschiffe ableiten lassen
abstract class Koerperform {
  String _farbe = "HEXWERT";
  Koordinaten _position = new Koordinaten(0, 0);
  int _id = 0;
  List<Koordinaten> _form = new List<Koordinaten>();
  int _damageValue = 0;
  int _lifeValue = 0;
  int _lebenAnzahl = 1;
//Penis
  ///Der Konstruktor von Koerperform
  Koerperform(this._farbe, this._position, this._id, this._form,
      this._damageValue, this._lifeValue, this._lebenAnzahl);

  ///Returned die Position des Raumschiffes oder Lasers
  Koordinaten get getPos => this._position;

  ///Returned die Farbe des Raumschiffes oder Lasers
  String get getFarbe => this._farbe;

  ///Ersetzt die Position durch den neu gegebenen Wert
  //TODO In Abgeleiteten Klassen überschreiben, muss hier nicht Implementiert werden
  void _setPosition() {
    //!!!Wird in den Kindklassen Implementiert
  }

  ///Rechnet einen Integer wert auf das aktuelle Leben an
  void updateLife(int addLifeValue) {
    this._lifeValue += addLifeValue;
  }

  ///Returned das damageValue
  int get getDamageValue => this._damageValue;

  ///Returned die ID
  int get getID => this._id;

  ///Updatet das raumschiff auf den nächsten Tick
  void onTick() {

  }

  ///Das Raumschiff überprüft ob es mit einer anderen Koerperform auf der selben
  ///Position steht
  //TODO Implementieren
  void collisionDetection() {

  }
}