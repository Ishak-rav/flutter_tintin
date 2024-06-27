import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class ReadingListProvider extends ChangeNotifier {
  final List<Album> _readingList = [];

  List<Album> get readingList => _readingList;

  void addAlbum(Album album) {
    _readingList.add(album);
    notifyListeners();
  }

  void removeAlbum(Album album) {
    _readingList.remove(album);
    notifyListeners();
  }
}
