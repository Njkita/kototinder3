class Cat {
  final String id;
  final String imageUrl;
  final String breedName;
  final String? description;
  final String? origin;
  final String? temperament;
  final String? lifeSpan;
  final DateTime? likedAt;

  Cat({
    required this.id,
    required this.imageUrl,
    required this.breedName,
    this.description,
    this.origin,
    this.temperament,
    this.lifeSpan,
    this.likedAt,
  });

  factory Cat.fromJson(Map<String, dynamic> json) {
    final breeds = json['breeds'] is List && (json['breeds'] as List).isNotEmpty
        ? (json['breeds'] as List).first
        : null;

    return Cat(
      id: json['id'] as String,
      imageUrl: json['url'] as String,
      breedName: breeds?['name'] ?? 'Unknown Breed',
      description: breeds?['description'] as String?,
      origin: breeds?['origin'] as String?,
      temperament: breeds?['temperament'] as String?,
      lifeSpan: breeds?['life_span'] as String?,
    );
  }

  Cat copyWith({
    String? id,
    String? imageUrl,
    String? breedName,
    String? description,
    String? origin,
    String? temperament,
    String? lifeSpan,
    DateTime? likedAt,
  }) {
    return Cat(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      origin: origin ?? this.origin,
      temperament: temperament ?? this.temperament,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      likedAt: likedAt ?? this.likedAt,
    );
  }
}