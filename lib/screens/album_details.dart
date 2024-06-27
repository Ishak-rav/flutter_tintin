import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/providers/reading_list_provider.dart';

class AlbumDetails extends StatelessWidget {
  final Album album;

  const AlbumDetails({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    final readingListProvider = Provider.of<ReadingListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(album.titre),
        actions: [
          IconButton(
            icon: Icon(readingListProvider.readingList.contains(album)
                ? Icons.bookmark_remove
                : Icons.bookmark_add),
            onPressed: () {
              if (readingListProvider.readingList.contains(album)) {
                readingListProvider.removeAlbum(album);
              } else {
                readingListProvider.addAlbum(album);
              }
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/${album.image}'),
            const SizedBox(height: 16.0),
            Text(
              'Titre: ${album.titre}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Text(
              'Numéro: ${album.numero}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Année de parution: ${album.parution}',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            if (album.parutionEnCouleur != null)
              Text(
                'Parution en couleur: ${album.parutionEnCouleur}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            const SizedBox(height: 16.0),
            Text(
              'Résumé: ${album.resume}',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
