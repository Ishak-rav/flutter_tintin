import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:tintin/models/album.dart';

class AlbumService {
  static Future<List<Album>> fetchAlbums() async {
    try {
      final response = await rootBundle.loadString('assets/albums.json');
      final List<dynamic> data = json.decode(response);
      return data.map((json) => Album.fromJson(json)).toList();
    } catch (e) {
      print('Erreur lors du chargement des albums: $e');
      return [];
    }
  }
}
