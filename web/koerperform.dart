import 'koordinaten.dart';
import 'spielModel.dart';

///Die Abstrakte Klasse Koerperform von der sich laser und
///raumschiffe ableiten lassen
abstract class Koerperform {
  String _farbe = "HEXWERT";
  Koordinaten _position = new Koordinaten(0, 0);
  int _id = 0;
  List<Koordinaten> _form = new List<Koordinaten>();
  int _damageValue = 0;
  int _lifeValue = 0;
  SpielModel _model;

  ///Der Konstruktor von Koerperform
  Koerperform(this._farbe, this._position, this._id, this._form,
      this._damageValue, this._lifeValue, this._model);

  ///Returned die Position des Raumschiffes oder Lasers
  Koordinaten get getPos => this._position;

  ///Returned die Farbe des Raumschiffes oder Lasers
  String get getFarbe => this._farbe;

  ///Ersetzt die Position durch den neu gegebenen Wert
  //TODO In Abgeleiteten Klassen überschreiben, muss hier nicht Implementiert werden
  void setPosition();

  ///Rechnet einen Integer wert auf das aktuelle Leben an
  ///Rueckgabewert gibt an, ob diese Koerperform zerstört wurde
  bool updateLife(int addLifeValue) {
    this._lifeValue += addLifeValue;
    return this._lifeValue <= 0;
  }

  ///Returned das damageValue
  int get getDamageValue => this._damageValue;


  ///Returned die ID
  int get getID => this._id;

  ///Updatet das raumschiff auf den nächsten Tick (konkrete Implementierung in den Kindklassen
  void onTick();


  ///Erkennt Kollisionen des Raumschiffs
  void collisionDetection() {
    for (int i = 0; i < _form.length; i++) {
      int x = this._position.getX + this._form[i].getX;
      int y = this._position.getY + this._form[i].getY;
      if (_model.spielfeld[x][y].length > 1) {
        int dv = _model.getDamageValue(_model.spielfeld[x][y][0]);
        _model.updateLife(_model.spielfeld[x][y][0], -this.getDamageValue);
        _model.updateLife(this.getID, -dv);
      }
    }
  }
}