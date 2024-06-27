import 'package:flutter/material.dart';
import '../models/album.dart';
import '../screens/album_details.dart';

class AlbumPreview extends StatelessWidget {
  final Album album;

  const AlbumPreview({super.key, required this.album});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black54,
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
      child: ListTile(
        leading: Image.asset(
          'assets/images/${album.image}',
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        title: Text(album.title, style: Theme.of(context).textTheme.bodyLarge),
        subtitle: Text('Parution: ${album.year}',
            style: Theme.of(context).textTheme.bodyMedium),
        trailing: const Icon(Icons.search, color: Colors.white),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AlbumDetails(album: album),
            ),
          );
        },
      ),
    );
  }
}
