import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;
  final VoidCallback onTap;

  const AlbumPreview({super.key, required this.album, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ListTile(
        leading: Image.asset(
          "assets/images/${album.image}",
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(album.titre, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text(
            'Parution: ${album.parution}${album.parutionEnCouleur != null ? ' (Couleur: ${album.parutionEnCouleur})' : ''}',
            style: Theme.of(context).textTheme.bodyMedium),
        trailing: const Icon(Icons.search, color: Colors.white),
        onTap: onTap,
      ),
    );
  }
}
