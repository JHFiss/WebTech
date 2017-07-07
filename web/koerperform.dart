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

  ///aktualisiert die Position
  //TODO sinnvoll?
  void setPosition(Koordinaten koordinaten) {
    this._position = koordinaten;
  }

  ///Rechnet einen Integer wert auf das aktuelle Leben an
  ///Rueckgabewert gibt an, ob diese Koerperform zerstört wurde
  bool updateLife(int addLifeValue) {
    List<List<List<int>>> game = _model.getSpielfeld;
    this._lifeValue += addLifeValue;
    if (this._lifeValue <= 0) {
      game = this.deleteFromGame(game);
      this.onDestruction();
      _model.setSpielfeld = game;
      return true;
    }
    return false;
  }

  ///entfernt dieses Objekt aus dem Spielfeld
  List<List<List<int>>> deleteFromGame(List<List<List<int>>> game) {
    for (int i = 0; i < _form.length; i++) {
      int x = this._position.getX + this._form[i].getX;
      int y = this._position.getY + this._form[i].getY;
      for (int a = 0; a < game[x][y].length; a++) {
        if (game[x][y][a] == this._id) {
          game[x][y].removeAt(a);
        }
      }
    }
    return game;
  }

  ///Methode, die bei Zerstörung einer Koerperform aufgerufen wird und Eventhandling betreibt
  void onDestruction() {

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
  //TODO neu implementiert, muss getestet werden
  void collisionDetection() {
    List<List<List<int>>> game = _model.getSpielfeld;
    for (int i = 0; i < _form.length; i++) {
      int x = this._position.getX + this._form[i].getX;
      int y = this._position.getY + this._form[i].getY;
      while (game[x][y].length > 1) {
        int dv = _model.getDamageValue(game[x][y][0]);
        _model.updateLife(game[x][y][0], -this.getDamageValue);
        _model.updateLife(this.getID, -dv);
      }
    }
  }
  
}