import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tintin/providers/reading_list_provider.dart';
import 'package:tintin/screens/album_details.dart';

class ReadingListScreen extends StatelessWidget {
  const ReadingListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final readingListProvider = Provider.of<ReadingListProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste de lecture'),
      ),
      body: ListView.builder(
        itemCount: readingListProvider.readingList.length,
        itemBuilder: (context, index) {
          final album = readingListProvider.readingList[index];
          return ListTile(
            leading: Image.asset('assets/images/${album.image}'),
            title: Text(
              album.titre,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            subtitle: Text('Numéro: ${album.numero}'),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                readingListProvider.removeAlbum(album);
              },
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AlbumDetails(album: album),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
