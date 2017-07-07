import 'spielModel.dart';
import 'dart:html';
import 'raumschiff.dart';
import 'koordinaten.dart';
import 'gegnerRaumschiff.dart';

///Die Klasse View die Genutzt wird um die Tabelle darzustellen
class View {
  SpielModel _spielModel;
  List<List<List<int>>> _spielfeld;
  ///Konstruktor der View
  //TODO Implementieren, verstehen
  View(SpielModel this._spielModel) {
    final validator = new NodeValidatorBuilder.common();
    validator.allowElement('td', attributes: ['row', 'col']);
    final validator2 = new NodeValidatorBuilder.common();
    validator2.allowElement('td', attributes: ['row', 'col']);
    querySelector('#gameTable').setInnerHtml(this._spielModel.toHtml(), validator: validator);
    querySelector('#liveCounter').setInnerHtml(this._spielModel.liveToHtml(), validator: validator2);
  }


  ///Updatet die Tabelle in der View
  void updateView() {
    TableCellElement e;
    this._spielfeld = _spielModel.getSpielfeld;
    for(int x = 0; x < 32; x++) {
      for(int y = 0; y < 18; y++) {
          e = querySelector('#gameTable td[col="${x}"][row="${y}"]');
          e.style.backgroundColor = "rgba(40,0,0, 0.3)";
          try{
            e.style.backgroundColor = this._spielModel.getColor(this._spielfeld[x][y][0]);
          }catch(e) {
            //Vorbildliches Exeptionhandling
          }
      }
    }
  }

}