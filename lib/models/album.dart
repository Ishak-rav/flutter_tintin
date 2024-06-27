class Album {
  final int numero;
  final String titre;
  final int parution;
  final String image;
  final int? parutionEnCouleur;
  final String resume;

  Album({
    required this.numero,
    required this.titre,
    required this.parution,
    required this.image,
    required this.resume,
    this.parutionEnCouleur,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      numero: json['numero'] ?? 0,
      titre: json['titre'] ?? 'Titre inconnu',
      parution: json['parution'] ?? 0,
      image: json['image'] ?? 'assets/images/default_cover.jpg',
      resume: json['resume'] ?? 'Résumé non disponible',
      parutionEnCouleur: json['parutionEnCouleur'],
    );
  }
}
