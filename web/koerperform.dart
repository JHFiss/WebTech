import 'koordinaten.dart';

///Die Abstrakte Klasse Koerperform von der sich laser und
///raumschiffe ableiten lassen
abstract class Koerperform {
  String _farbe = "HEXWERT";
  Koordinaten _position = new Koordinaten(0, 0);
  int _geschwindigkeitHorizontal = 0;
  int _geschwindigkeitVertikal = 0;
  int _id = null;
  List<Koordinaten> _form = null;

  ///Der Konstruktor von Koerperform
  Koerperform(this._farbe, this._position, this._geschwindigkeitHorizontal,
      this._geschwindigkeitVertikal, this._id, this._form);

  ///Updateted die Position eines RaumschiffeS oder Lasers mittels des offsetts
  ///und der geschwindigkeiten
  bool updatePos(Koordinaten offset) {
    this._position = offset;
    return true;
  }

  ///Returned die Position des Raumschiffes oder Lasers
  Koordinaten get getPos => this._position;

  ///Returned die Farbe des Raumschiffes oder Lasers
  String get getFarbe => this._farbe;

  List<Koordinaten> get getForm => this._form;
}