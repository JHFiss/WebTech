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



  ///Rechnet einen Integer wert auf das aktuelle Leben an
  ///Rueckgabewert gibt an, ob diese Koerperform zerstört wurde
  //TODO testen
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

  ///Bewegt ein Raumschiff, trägt es aus den alten Feldern aus, in die neuen ein und aktualisiert die position und das Spielfeld
  //TODO testen
  List<List<List<int>>> move(List<List<List<int>>> game, Koordinaten k) {
    for (int i = 0; i < _form.length; i++) {
      int x = this._position.getX + this._form[i].getX;
      int y = this._position.getY + this._form[i].getY;
      for (int a = 0; a < game[x][y].length; a++) {
        if (game[x][y][a] == this._id) {
          game[x][y].removeAt(a);
        }
      }
      game[x + k.getX][y + k.getY].add(this.getID);
    }
    this._position.setKoordinaten(this._position.getX + k.getX, this._position.getY + k.getY);
    return game;
  }

  ///entfernt dieses Objekt aus dem Spielfeld
  //TODO testen
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
    this._model.despawnEntity(this.getID);

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

  ///setzt die ID auf einen anderen Wert
  void set setID(int id) {
    this._id = id;
  }

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