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

  void setPosition(Koordinaten koordinaten) {
    this._position = koordinaten;
  }

  //added eine id einer Koerperform in das spielfeld
  void setSpielfeld(int x, int y , int value) {
    this._model.spielfeld[x][y].add(value);
  }
  ///Rechnet einen Integer wert auf das aktuelle Leben an
  ///Rueckgabewert gibt an, ob diese Koerperform zerstört wurde
  bool updateLife(int addLifeValue) {
    this._lifeValue += addLifeValue;
    if (this._lifeValue <= 0) {
      for (int i = 0; i < _form.length; i++) {
        int x = this._position.getX + this._form[i].getX;
        int y = this._position.getY + this._form[i].getY;
        for (int a = 0; a < _model.spielfeld[x][y].length; a++) {
          if (_model.spielfeld[x][y][a] == this._id) {
            _model.spielfeld[x][y].removeAt(a);
          }
        }
      }
      return true;
    }
    return false;
  }

  ///Returned das damageValue
  int get getDamageValue => this._damageValue;

  List<Koordinaten> get getForm => this._form;
  ///Returned die ID
  int get getID => this._id;

  ///Updatet das raumschiff auf den nächsten Tick (konkrete Implementierung in den Kindklassen
  void onTick(Koordinaten koordinaten);

  SpielModel get getModel => this._model;

  ///Erkennt Kollisionen des Raumschiffs
  void collisionDetection() {
    for (int i = 0; i < _form.length; i++) {
      int x = this._position.getX + this._form[i].getX;
      int y = this._position.getY + this._form[i].getY;
      while (_model.spielfeld[x][y].length > 1) {
        int dv = _model.getDamageValue(_model.spielfeld[x][y][0]);
        _model.updateLife(_model.spielfeld[x][y][0], -this.getDamageValue);
        _model.updateLife(this.getID, -dv);
      }
    }
  }

  void positonToSpielfeld() {
    //Setzt den startwert der koerperform in das spielfeld
    this._model.setSpielfeld(getPos.getX, getPos.getY, getID);

    //Setzt die offsets der koerperform in das spielfeld
    getForm.forEach((koerperOffset) {
      this._model.setSpielfeld(getPos.getX + koerperOffset.getX,
          getPos.getY + koerperOffset.getY, getID);
    });

  }
}