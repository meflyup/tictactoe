library cell_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import '../../model/cell.dart';

@CustomTag('cell-view')
class CellView extends TableCellElement with Polymer, Observable {
  @published Cell cell;
  @published String currentPlayer;
  @published bool gridInterfaceEnabled;

  @observable bool highlight = true;

  // we need this stuff because we're extending <td> instead of PolymerElement
  factory CellView() => new Element.tag('td', 'cell-view');
  CellView.created() : super.created() {
    polymerCreated();
  }

  @override void attached() {
    super.attached();
    //print("CellView::attached()");
  }

  void clicked(Event event, var detail, Element target) {
    if (gridInterfaceEnabled && cell.isEmpty) {
      cell.state = currentPlayer;
      dispatchEvent(new CustomEvent("cell-state-change"));
    }
  }
}
