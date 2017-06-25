import 'spielModel.dart';
import 'dart:html';
import 'raumschiff.dart';
import 'koordinaten.dart';
import 'gegnerRaumschiff.dart';

///Die Klasse View die Genutzt wird um die Tabelle darzustellen
class View {
  SpielModel _spielModel;
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


  ///Updatet die Tabelle
  //TODO Implementieren und Übergabeparameter überlegen
  void updateView() {

  }

}