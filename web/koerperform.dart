import 'koordinaten.dart';

///Die Abstrakte Klasse Koerperform von der sich laser und
///raumschiffe ableiten lassen
abstract class Koerperform {
  String _farbe = "HEXWERT";
  Koordinaten _position = new Koordinaten(0, 0);
  int _geschwindigkeitHorizontal = 0;
  int _geschwindigkeitVertikal = 0;
  int _id = 0;
  List<Koordinaten> _form = null;
  int _damageValue = 0;
  int _lifeValue = 0;
  int _lebenAnzahl = 1;

  ///Der Konstruktor von Koerperform
  Koerperform(this._farbe, this._position, this._geschwindigkeitHorizontal,
      this._geschwindigkeitVertikal, this._id, this._form, this._damageValue, this._lifeValue, this._lebenAnzahl);

  ///Updateted die Position eines RaumschiffeS oder Lasers mittels des offsetts
  ///und der geschwindigkeiten
  //TODO muss noch richtig Implementiert werden
  bool updatePos(Koordinaten offset) {
    this._position = offset;
    return true;
  }

  ///Returned die Position des Raumschiffes oder Lasers
  Koordinaten get getPos => this._position;

  ///Returned die Farbe des Raumschiffes oder Lasers
  String get getFarbe => this._farbe;

  ///Returned die Liste mit den Offset die, die Form ergeben
  List<Koordinaten> get getForm => this._form;

  ///Ersetzt die Position durch den neu gegebenen Wert
  void set setPosition(Koordinaten position) {
    this._position = position;
  }

  ///Rechnet einen Integer wert auf das aktuelle Leben an
  void updateLifeValue(int addLifeValue) {
    this._lifeValue += addLifeValue;
  }

  ///Returned anzahl der Leben
  int get getLebenAnzahl => this._lebenAnzahl;

  ///Returned das damageValue
  int get getDamageValue => this._damageValue;

  ///Returned die ID
  int get getID => this._id;

  ///Dekrementiert die Lebens Anzahl um eins
  void dekLebenAnzahl() {
    this._lebenAnzahl--;
  }
}