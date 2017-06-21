import 'koordinaten.dart';
import 'dart:io';

//TODO Image einfuegen und get/set Hinterund Implementieren
///Die Klasse Level die die Level Informationen in sich traegt
class Level {
  int _levelID = 1;
  Koordinaten _spielerSpawn = null;
  List<Koordinaten> _gegnerRaumschiffSpawn = null;
  int _gegnerSpawnIterator = 0;
  int _levelHighscore = 0;
  int _levelGeschwindigkeit = 1;


  ///Konstruktor des Levels
  Level(this._levelID, this._gegnerRaumschiffSpawn, this._spielerSpawn, this._levelGeschwindigkeit);

  ///Returet die Level ID
  int get getLevelID => this._levelID;

  ///Returned die Position des SpielerSpawns
  Koordinaten get getSpielerSpawn => this._spielerSpawn;

  ///Returned die Position vom naechsten Raumschiff das gespawnt werden soll
  Koordinaten get getRaumschiffSpawn => this._gegnerRaumschiffSpawn[++_gegnerSpawnIterator];

  ///Returned den highscore des Levels
  int get getLevelHighscore => this._levelHighscore;

  ///Returned true und Setzt den neuen highscore des Levels falls der neue highscore hoere ist.
  ///Returned false wenn nicht
  bool isNewLevelHighscore(int levelHighscore) {
    if(this._levelHighscore < levelHighscore) {
      this._levelHighscore = levelHighscore;
      return true;
    }

    return false;
  }

  ///Returned die Hintergrund geschwindigkeit
  int get getLevelGeschwindigkeit => this._levelGeschwindigkeit;

}