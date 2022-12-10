import 'cell.dart';

class Table<T> {
  final Iterable<Iterable<T>> _rows;
  final List<List<Cell<T>>> _cells = [];

  Table(this._rows) {
    if (_rows.isEmpty) {
      throw ArgumentError.value(_rows);
    }

    _initializeCells();
  }

  int get rowLength => _rows.length;

  int get columnsLength => _rows.first.length;

  List<List<Cell<T>>> get cellsInRows => _cells;

  List<List<Cell<T>>> get cellsInColumns {
    List<List<Cell<T>>> columns = [];

    for (var i = 0; i < columnsLength; i++) {
      List<Cell<T>> column = [];

      for (var j = 0; j < rowLength; j++) {
        column.add(_cells.elementAt(j).elementAt(i));
      }

      columns.add(column);
    }

    return columns;
  }

  T getValue(int rowIndex, int columnIndex) {
    if (_isValidRowIndex(rowIndex)) {
      if (_isValidColumnIndex(columnIndex)) {
        return _cells.elementAt(rowIndex).elementAt(columnIndex).value;
      }
      throw ArgumentError.value(columnIndex);
    }
    throw ArgumentError.value(rowIndex);
  }

  Iterable<Cell<T>> asIterableCells() sync* {
    for (var i = 0; i < rowLength; i++) {
      for (var j = 0; j < columnsLength; j++) {
        yield _cells.elementAt(i).elementAt(j);
      }
    }
  }

  void _initializeCells() {
    for (var i = 0; i < rowLength; i++) {
      List<Cell<T>> row = [];
      for (var j = 0; j < columnsLength; j++) {
        row.add(Cell(j, i, _rows.elementAt(i).elementAt(j)));
      }
      _cells.add(row);
    }
  }

  bool _isValidRowIndex(int index) {
    return index >= 0 && index < rowLength;
  }

  bool _isValidColumnIndex(int index) {
    return index >= 0 && index < columnsLength;
  }
}
