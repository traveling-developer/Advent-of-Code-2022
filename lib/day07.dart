import 'package:adventofcode2022/day.dart';
import 'package:adventofcode2022/helper/string_extensions.dart';
import 'package:collection/collection.dart';

class Day7 implements Day {
  @override
  int get dayNumber => 7;

  @override
  String solveFirstPuzzle(String puzzleInput) {
    Folder rootFolder = parseFolderStructure(puzzleInput);

    List<Folder> smallFolders = [];
    findSmallFolders(rootFolder, smallFolders);

    final totalSizeOfSmallFolders = smallFolders.map((e) => e.size()).sum;

    return totalSizeOfSmallFolders.toString();
  }

  @override
  String solveSecondPuzzle(String puzzleInput) {
    Folder rootFolder = parseFolderStructure(puzzleInput);

    final totalDiskSpace = 70000000;
    final neededSpaceForUpdate = 30000000;

    final freeSpace = totalDiskSpace - rootFolder.size();
    final missingFreeSpace = neededSpaceForUpdate - freeSpace;

    List<Folder> allFolders = [];
    getAllFolders(rootFolder, allFolders);

    var sortedFoldersWithEnoughSpace = allFolders
        .where((element) => element.size() >= missingFreeSpace)
        .sorted((a, b) => a.size().compareTo(b.size()));

    return sortedFoldersWithEnoughSpace.first.size().toString();
  }

  void getAllFolders(Folder folder, List<Folder> folders) {
    folders.add(folder);

    for (var element in folder.folders) {
      getAllFolders(element, folders);
    }
  }

  void findSmallFolders(Folder folder, List<Folder> smallFolders) {
    if (folder.size() <= 100000) {
      smallFolders.add(folder);
    }

    for (var element in folder.folders) {
      findSmallFolders(element, smallFolders);
    }
  }

  Folder parseFolderStructure(String puzzleInput) {
    final input = puzzleInput.splitPerLine();

    final rootFolder = Folder('dir root');

    Folder currentFolder = rootFolder;

    for (var element in input) {
      if (element == "\$ cd /") {
        currentFolder = rootFolder;
        continue;
      }
      if (element == "\$ cd ..") {
        currentFolder = currentFolder.parent;
        continue;
      }
      if (element == "\$ ls") {
        continue;
      }
      if (element.startsWith("\$ cd ")) {
        final folderName = element.split(' ').toList()[2];
        currentFolder = currentFolder.folders.singleWhere((f) => f.name == folderName);

        continue;
      }
      if (element.startsWith('dir')) {
        final folder = Folder(element);
        folder.parent = currentFolder;

        if (currentFolder.folders.where((f) => f.name == folder.name).isEmpty) {
          currentFolder.folders.add(folder);
        }
      } else {
        final file = File(element);

        if (currentFolder.files.where((f) => f.name == file.name).isEmpty) {
          currentFolder.files.add(file);
        }
      }
    }
    return rootFolder;
  }
}

class Folder {
  List<Folder> folders = [];
  List<File> files = [];
  String name = '';
  late Folder parent;

  Folder(String rawFolder) {
    name = rawFolder.split(' ')[1];
  }

  int size() {
    var fileSize = files.map((e) => e.size).sum;
    var folderSize = folders.map((e) => e.size()).sum;

    return fileSize + folderSize;
  }
}

class File {
  int size = 0;
  String name = '';

  File(String rawFile) {
    final sizeAndName = rawFile.split(' ');

    size = int.parse(sizeAndName[0]);
    name = sizeAndName[1];
  }
}
