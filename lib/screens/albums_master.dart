import 'package:flutter/material.dart';
import 'package:tintin/models/album.dart';
import 'package:tintin/screens/album_details.dart';
import 'package:tintin/widgets/album_preview.dart';
import 'package:tintin/services/album_service.dart';
import 'package:tintin/screens/reading_list_screen.dart';

class AlbumsMaster extends StatelessWidget {
  const AlbumsMaster({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Albums de Tintin'),
        actions: [
          IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReadingListScreen(),
                ),
              );
            },
          ),
        ],
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
                return AlbumPreview(
                  album: albums[index],
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AlbumDetails(album: albums[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
