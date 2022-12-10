import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:adventofcode2022/helper/table.dart';

import 'helper/cell.dart';

class Day8 implements Day {
  @override
  int get dayNumber => 8;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    final treeRows = puzzleInput.splitPerLine().map((e) => e.split('').map((e) => int.parse(e)));
    final table = Table(treeRows);
    final columns = table.cellsInColumns;
    final rows = table.cellsInRows;

    var visibleTrees = 0;
    visibleTrees += (2 * table.rowLength);
    visibleTrees += (2 * (columns.length - 2));

    List<Cell<int>> trees = [];
    findVisibleTrees(columns, trees);
    findVisibleTrees(rows, trees);

    visibleTrees += trees.length;

    return visibleTrees.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    final treeRows = puzzleInput.splitPerLine().map((e) => e.split('').map((e) => int.parse(e)));
    final table = Table(treeRows);

    List<int> scenicScores = [];
    for (var tree in table.asIterableCells()) {
      if (tree.x == 0 ||
          tree.y == 0 ||
          tree.x == table.columnsLength - 1 ||
          tree.y == table.rowLength - 1) {
        continue;
      }
      var up = upViewingDistance(tree, table);
      var down = downViewingDistance(tree, table);
      var left = leftViewingDistance(tree, table);
      var right = rightViewingDistance(tree, table);

      var scenicScore = up * down * left * right;
      scenicScores.add(scenicScore);
    }

    scenicScores.sort();

    return scenicScores.last.toString();
  }

  void findVisibleTrees(List<Iterable<Cell<int>>> listOfListOfTrees, List<Cell<int>> visibleTrees) {
    for (var j = 1; j < listOfListOfTrees.length - 1; j++) {
      var listOfTrees = listOfListOfTrees[j].toList();

      findVisibleTreeInList(listOfTrees, visibleTrees);
      findVisibleTreeInList(listOfTrees.reversed.toList(), visibleTrees);
    }
  }

  void findVisibleTreeInList(List<Cell<int>> trees, List<Cell<int>> visibleTrees) {
    for (var i = 1; i < trees.length - 1; i++) {
      var tree = trees[i];
      if (tree.value > trees.first.value &&
          trees.sublist(1, i).every((element) => element.value < tree.value) &&
          !visibleTrees.contains(tree)) {
        visibleTrees.add(tree);
      }
    }
  }

  int upViewingDistance(Cell<int> tree, Table<int> table) {
    return calculateViewingDistance(
        tree, table, (distance) => table.getValue(tree.y + distance, tree.x));
  }

  int downViewingDistance(Cell<int> tree, Table<int> table) {
    return calculateViewingDistance(
        tree, table, (distance) => table.getValue(tree.y - distance, tree.x));
  }

  int leftViewingDistance(Cell<int> tree, Table<int> table) {
    return calculateViewingDistance(
        tree, table, (distance) => table.getValue(tree.y, tree.x + distance));
  }

  int rightViewingDistance(Cell<int> tree, Table<int> table) {
    return calculateViewingDistance(
        tree, table, (distance) => table.getValue(tree.y, tree.x - distance));
  }

  int calculateViewingDistance(
      Cell<int> tree, Table<int> table, int Function(int distance) getNeighborTreeSizeInDistance) {
    bool lookUp = true;
    int viewDistance = 1;
    try {
      while (lookUp) {
        var treeSize = getNeighborTreeSizeInDistance(viewDistance);
        if (treeSize >= tree.value) {
          lookUp = false;
        } else {
          viewDistance++;
        }
      }
    } catch (e) {
      viewDistance--;
    }

    return viewDistance;
  }
}
