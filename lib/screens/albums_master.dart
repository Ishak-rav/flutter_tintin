import 'package:flutter/material.dart';
import '../models/album.dart';
import '../services/album_service.dart';
import '../widgets/album_preview.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums de Tintin'),
        backgroundColor: Colors.red,
      ),
      body: FutureBuilder<List<Album>>(
        future: AlbumService.fetchAlbums(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text('Erreur: ${snapshot.error}',
                    style: const TextStyle(color: Colors.white)));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('Aucun album trouvé',
                    style: TextStyle(color: Colors.white)));
          } else {
            final albums = snapshot.data!;
            return ListView.builder(
              itemCount: albums.length,
              itemBuilder: (context, index) {
                return AlbumPreview(album: albums[index]);
              },
            );
          }
        },
      ),
    );
  }
}
