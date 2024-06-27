# Albums de Tintin

Une application Flutter simple pour afficher et explorer les albums de Tintin. L'application permet de visualiser une liste d'albums, d'afficher les détails de chaque album et d'ajouter des albums à une liste de lecture.

## Fonctionnalités

- Affichage de la liste des albums : Consultez la liste complète des albums de Tintin avec des images miniatures.
- Détails de l'album : Affichez des informations détaillées sur chaque album, y compris le résumé, l'année de parution et une image de couverture.
- Liste de lecture : Ajoutez des albums à votre liste de lecture personnelle.

## Installation

1. Clonez le dépôt :

```sh
git clone https://github.com/votre-utilisateur/tintin-albums.git
cd tintin-albums
```

2. Installez les dépendances :

```sh
flutter pub get
```

3. Assurez-vous que les images et le fichier JSON sont présents dans le dossier assets et référencés correctement dans pubspec.yaml.

## Lancer l'application

Pour lancer l'application sur un simulateur ou un appareil physique :

```sh
flutter run
```

## Structure du projet

- `lib/models/album.dart` : Classe modèle pour les albums de Tintin.
- `lib/services/album_service.dart` : Service pour charger les données des albums à partir d'un fichier JSON.
- `lib/screens/albums_master.dart` : Écran principal affichant la liste des albums.
- `lib/screens/album_details.dart` : Écran affichant les détails d'un album spécifique.
- `lib/widgets/album_preview.dart` : Widget pour afficher un aperçu de chaque album dans la liste.
- `lib/providers/reading_list_provider.dart` : Provider pour gérer la liste de lecture.
