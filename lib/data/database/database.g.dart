// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $CatsTable extends Cats with TableInfo<$CatsTable, Cat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedNameMeta =
      const VerificationMeta('breedName');
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
      'breed_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _temperamentMeta =
      const VerificationMeta('temperament');
  @override
  late final GeneratedColumn<String> temperament = GeneratedColumn<String>(
      'temperament', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lifeSpanMeta =
      const VerificationMeta('lifeSpan');
  @override
  late final GeneratedColumn<String> lifeSpan = GeneratedColumn<String>(
      'life_span', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _likedAtMeta =
      const VerificationMeta('likedAt');
  @override
  late final GeneratedColumn<DateTime> likedAt = GeneratedColumn<DateTime>(
      'liked_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        imageUrl,
        breedName,
        description,
        origin,
        temperament,
        lifeSpan,
        likedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cats';
  @override
  VerificationContext validateIntegrity(Insertable<Cat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(_breedNameMeta,
          breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta));
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('temperament')) {
      context.handle(
          _temperamentMeta,
          temperament.isAcceptableOrUnknown(
              data['temperament']!, _temperamentMeta));
    }
    if (data.containsKey('life_span')) {
      context.handle(_lifeSpanMeta,
          lifeSpan.isAcceptableOrUnknown(data['life_span']!, _lifeSpanMeta));
    }
    if (data.containsKey('liked_at')) {
      context.handle(_likedAtMeta,
          likedAt.isAcceptableOrUnknown(data['liked_at']!, _likedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Cat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Cat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      breedName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin']),
      temperament: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}temperament']),
      lifeSpan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}life_span']),
      likedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}liked_at']),
    );
  }

  @override
  $CatsTable createAlias(String alias) {
    return $CatsTable(attachedDatabase, alias);
  }
}

class Cat extends DataClass implements Insertable<Cat> {
  final String id;
  final String imageUrl;
  final String breedName;
  final String? description;
  final String? origin;
  final String? temperament;
  final String? lifeSpan;
  final DateTime? likedAt;
  const Cat(
      {required this.id,
      required this.imageUrl,
      required this.breedName,
      this.description,
      this.origin,
      this.temperament,
      this.lifeSpan,
      this.likedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed_name'] = Variable<String>(breedName);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || temperament != null) {
      map['temperament'] = Variable<String>(temperament);
    }
    if (!nullToAbsent || lifeSpan != null) {
      map['life_span'] = Variable<String>(lifeSpan);
    }
    if (!nullToAbsent || likedAt != null) {
      map['liked_at'] = Variable<DateTime>(likedAt);
    }
    return map;
  }

  CatsCompanion toCompanion(bool nullToAbsent) {
    return CatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breedName: Value(breedName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      temperament: temperament == null && nullToAbsent
          ? const Value.absent()
          : Value(temperament),
      lifeSpan: lifeSpan == null && nullToAbsent
          ? const Value.absent()
          : Value(lifeSpan),
      likedAt: likedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(likedAt),
    );
  }

  factory Cat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Cat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breedName: serializer.fromJson<String>(json['breedName']),
      description: serializer.fromJson<String?>(json['description']),
      origin: serializer.fromJson<String?>(json['origin']),
      temperament: serializer.fromJson<String?>(json['temperament']),
      lifeSpan: serializer.fromJson<String?>(json['lifeSpan']),
      likedAt: serializer.fromJson<DateTime?>(json['likedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breedName': serializer.toJson<String>(breedName),
      'description': serializer.toJson<String?>(description),
      'origin': serializer.toJson<String?>(origin),
      'temperament': serializer.toJson<String?>(temperament),
      'lifeSpan': serializer.toJson<String?>(lifeSpan),
      'likedAt': serializer.toJson<DateTime?>(likedAt),
    };
  }

  Cat copyWith(
          {String? id,
          String? imageUrl,
          String? breedName,
          Value<String?> description = const Value.absent(),
          Value<String?> origin = const Value.absent(),
          Value<String?> temperament = const Value.absent(),
          Value<String?> lifeSpan = const Value.absent(),
          Value<DateTime?> likedAt = const Value.absent()}) =>
      Cat(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        breedName: breedName ?? this.breedName,
        description: description.present ? description.value : this.description,
        origin: origin.present ? origin.value : this.origin,
        temperament: temperament.present ? temperament.value : this.temperament,
        lifeSpan: lifeSpan.present ? lifeSpan.value : this.lifeSpan,
        likedAt: likedAt.present ? likedAt.value : this.likedAt,
      );
  Cat copyWithCompanion(CatsCompanion data) {
    return Cat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      description:
          data.description.present ? data.description.value : this.description,
      origin: data.origin.present ? data.origin.value : this.origin,
      temperament:
          data.temperament.present ? data.temperament.value : this.temperament,
      lifeSpan: data.lifeSpan.present ? data.lifeSpan.value : this.lifeSpan,
      likedAt: data.likedAt.present ? data.likedAt.value : this.likedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Cat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('origin: $origin, ')
          ..write('temperament: $temperament, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('likedAt: $likedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, imageUrl, breedName, description, origin,
      temperament, lifeSpan, likedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Cat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breedName == this.breedName &&
          other.description == this.description &&
          other.origin == this.origin &&
          other.temperament == this.temperament &&
          other.lifeSpan == this.lifeSpan &&
          other.likedAt == this.likedAt);
}

class CatsCompanion extends UpdateCompanion<Cat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breedName;
  final Value<String?> description;
  final Value<String?> origin;
  final Value<String?> temperament;
  final Value<String?> lifeSpan;
  final Value<DateTime?> likedAt;
  final Value<int> rowid;
  const CatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breedName = const Value.absent(),
    this.description = const Value.absent(),
    this.origin = const Value.absent(),
    this.temperament = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CatsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breedName,
    this.description = const Value.absent(),
    this.origin = const Value.absent(),
    this.temperament = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.likedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        imageUrl = Value(imageUrl),
        breedName = Value(breedName);
  static Insertable<Cat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breedName,
    Expression<String>? description,
    Expression<String>? origin,
    Expression<String>? temperament,
    Expression<String>? lifeSpan,
    Expression<DateTime>? likedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breedName != null) 'breed_name': breedName,
      if (description != null) 'description': description,
      if (origin != null) 'origin': origin,
      if (temperament != null) 'temperament': temperament,
      if (lifeSpan != null) 'life_span': lifeSpan,
      if (likedAt != null) 'liked_at': likedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CatsCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageUrl,
      Value<String>? breedName,
      Value<String?>? description,
      Value<String?>? origin,
      Value<String?>? temperament,
      Value<String?>? lifeSpan,
      Value<DateTime?>? likedAt,
      Value<int>? rowid}) {
    return CatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      origin: origin ?? this.origin,
      temperament: temperament ?? this.temperament,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      likedAt: likedAt ?? this.likedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (temperament.present) {
      map['temperament'] = Variable<String>(temperament.value);
    }
    if (lifeSpan.present) {
      map['life_span'] = Variable<String>(lifeSpan.value);
    }
    if (likedAt.present) {
      map['liked_at'] = Variable<DateTime>(likedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('origin: $origin, ')
          ..write('temperament: $temperament, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('likedAt: $likedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedCatsTable extends CachedCats
    with TableInfo<$CachedCatsTable, CachedCat> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCatsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageUrlMeta =
      const VerificationMeta('imageUrl');
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
      'image_url', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _breedNameMeta =
      const VerificationMeta('breedName');
  @override
  late final GeneratedColumn<String> breedName = GeneratedColumn<String>(
      'breed_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _originMeta = const VerificationMeta('origin');
  @override
  late final GeneratedColumn<String> origin = GeneratedColumn<String>(
      'origin', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _temperamentMeta =
      const VerificationMeta('temperament');
  @override
  late final GeneratedColumn<String> temperament = GeneratedColumn<String>(
      'temperament', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lifeSpanMeta =
      const VerificationMeta('lifeSpan');
  @override
  late final GeneratedColumn<String> lifeSpan = GeneratedColumn<String>(
      'life_span', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, imageUrl, breedName, description, origin, temperament, lifeSpan];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_cats';
  @override
  VerificationContext validateIntegrity(Insertable<CachedCat> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(_imageUrlMeta,
          imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta));
    } else if (isInserting) {
      context.missing(_imageUrlMeta);
    }
    if (data.containsKey('breed_name')) {
      context.handle(_breedNameMeta,
          breedName.isAcceptableOrUnknown(data['breed_name']!, _breedNameMeta));
    } else if (isInserting) {
      context.missing(_breedNameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('origin')) {
      context.handle(_originMeta,
          origin.isAcceptableOrUnknown(data['origin']!, _originMeta));
    }
    if (data.containsKey('temperament')) {
      context.handle(
          _temperamentMeta,
          temperament.isAcceptableOrUnknown(
              data['temperament']!, _temperamentMeta));
    }
    if (data.containsKey('life_span')) {
      context.handle(_lifeSpanMeta,
          lifeSpan.isAcceptableOrUnknown(data['life_span']!, _lifeSpanMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCat map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCat(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      imageUrl: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image_url'])!,
      breedName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}breed_name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      origin: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}origin']),
      temperament: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}temperament']),
      lifeSpan: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}life_span']),
    );
  }

  @override
  $CachedCatsTable createAlias(String alias) {
    return $CachedCatsTable(attachedDatabase, alias);
  }
}

class CachedCat extends DataClass implements Insertable<CachedCat> {
  final String id;
  final String imageUrl;
  final String breedName;
  final String? description;
  final String? origin;
  final String? temperament;
  final String? lifeSpan;
  const CachedCat(
      {required this.id,
      required this.imageUrl,
      required this.breedName,
      this.description,
      this.origin,
      this.temperament,
      this.lifeSpan});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['image_url'] = Variable<String>(imageUrl);
    map['breed_name'] = Variable<String>(breedName);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || origin != null) {
      map['origin'] = Variable<String>(origin);
    }
    if (!nullToAbsent || temperament != null) {
      map['temperament'] = Variable<String>(temperament);
    }
    if (!nullToAbsent || lifeSpan != null) {
      map['life_span'] = Variable<String>(lifeSpan);
    }
    return map;
  }

  CachedCatsCompanion toCompanion(bool nullToAbsent) {
    return CachedCatsCompanion(
      id: Value(id),
      imageUrl: Value(imageUrl),
      breedName: Value(breedName),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      origin:
          origin == null && nullToAbsent ? const Value.absent() : Value(origin),
      temperament: temperament == null && nullToAbsent
          ? const Value.absent()
          : Value(temperament),
      lifeSpan: lifeSpan == null && nullToAbsent
          ? const Value.absent()
          : Value(lifeSpan),
    );
  }

  factory CachedCat.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCat(
      id: serializer.fromJson<String>(json['id']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
      breedName: serializer.fromJson<String>(json['breedName']),
      description: serializer.fromJson<String?>(json['description']),
      origin: serializer.fromJson<String?>(json['origin']),
      temperament: serializer.fromJson<String?>(json['temperament']),
      lifeSpan: serializer.fromJson<String?>(json['lifeSpan']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'imageUrl': serializer.toJson<String>(imageUrl),
      'breedName': serializer.toJson<String>(breedName),
      'description': serializer.toJson<String?>(description),
      'origin': serializer.toJson<String?>(origin),
      'temperament': serializer.toJson<String?>(temperament),
      'lifeSpan': serializer.toJson<String?>(lifeSpan),
    };
  }

  CachedCat copyWith(
          {String? id,
          String? imageUrl,
          String? breedName,
          Value<String?> description = const Value.absent(),
          Value<String?> origin = const Value.absent(),
          Value<String?> temperament = const Value.absent(),
          Value<String?> lifeSpan = const Value.absent()}) =>
      CachedCat(
        id: id ?? this.id,
        imageUrl: imageUrl ?? this.imageUrl,
        breedName: breedName ?? this.breedName,
        description: description.present ? description.value : this.description,
        origin: origin.present ? origin.value : this.origin,
        temperament: temperament.present ? temperament.value : this.temperament,
        lifeSpan: lifeSpan.present ? lifeSpan.value : this.lifeSpan,
      );
  CachedCat copyWithCompanion(CachedCatsCompanion data) {
    return CachedCat(
      id: data.id.present ? data.id.value : this.id,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
      breedName: data.breedName.present ? data.breedName.value : this.breedName,
      description:
          data.description.present ? data.description.value : this.description,
      origin: data.origin.present ? data.origin.value : this.origin,
      temperament:
          data.temperament.present ? data.temperament.value : this.temperament,
      lifeSpan: data.lifeSpan.present ? data.lifeSpan.value : this.lifeSpan,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCat(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('origin: $origin, ')
          ..write('temperament: $temperament, ')
          ..write('lifeSpan: $lifeSpan')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, imageUrl, breedName, description, origin, temperament, lifeSpan);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCat &&
          other.id == this.id &&
          other.imageUrl == this.imageUrl &&
          other.breedName == this.breedName &&
          other.description == this.description &&
          other.origin == this.origin &&
          other.temperament == this.temperament &&
          other.lifeSpan == this.lifeSpan);
}

class CachedCatsCompanion extends UpdateCompanion<CachedCat> {
  final Value<String> id;
  final Value<String> imageUrl;
  final Value<String> breedName;
  final Value<String?> description;
  final Value<String?> origin;
  final Value<String?> temperament;
  final Value<String?> lifeSpan;
  final Value<int> rowid;
  const CachedCatsCompanion({
    this.id = const Value.absent(),
    this.imageUrl = const Value.absent(),
    this.breedName = const Value.absent(),
    this.description = const Value.absent(),
    this.origin = const Value.absent(),
    this.temperament = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CachedCatsCompanion.insert({
    required String id,
    required String imageUrl,
    required String breedName,
    this.description = const Value.absent(),
    this.origin = const Value.absent(),
    this.temperament = const Value.absent(),
    this.lifeSpan = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        imageUrl = Value(imageUrl),
        breedName = Value(breedName);
  static Insertable<CachedCat> custom({
    Expression<String>? id,
    Expression<String>? imageUrl,
    Expression<String>? breedName,
    Expression<String>? description,
    Expression<String>? origin,
    Expression<String>? temperament,
    Expression<String>? lifeSpan,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (imageUrl != null) 'image_url': imageUrl,
      if (breedName != null) 'breed_name': breedName,
      if (description != null) 'description': description,
      if (origin != null) 'origin': origin,
      if (temperament != null) 'temperament': temperament,
      if (lifeSpan != null) 'life_span': lifeSpan,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CachedCatsCompanion copyWith(
      {Value<String>? id,
      Value<String>? imageUrl,
      Value<String>? breedName,
      Value<String?>? description,
      Value<String?>? origin,
      Value<String?>? temperament,
      Value<String?>? lifeSpan,
      Value<int>? rowid}) {
    return CachedCatsCompanion(
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      breedName: breedName ?? this.breedName,
      description: description ?? this.description,
      origin: origin ?? this.origin,
      temperament: temperament ?? this.temperament,
      lifeSpan: lifeSpan ?? this.lifeSpan,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    if (breedName.present) {
      map['breed_name'] = Variable<String>(breedName.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (origin.present) {
      map['origin'] = Variable<String>(origin.value);
    }
    if (temperament.present) {
      map['temperament'] = Variable<String>(temperament.value);
    }
    if (lifeSpan.present) {
      map['life_span'] = Variable<String>(lifeSpan.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatsCompanion(')
          ..write('id: $id, ')
          ..write('imageUrl: $imageUrl, ')
          ..write('breedName: $breedName, ')
          ..write('description: $description, ')
          ..write('origin: $origin, ')
          ..write('temperament: $temperament, ')
          ..write('lifeSpan: $lifeSpan, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CatsTable cats = $CatsTable(this);
  late final $CachedCatsTable cachedCats = $CachedCatsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cats, cachedCats];
}

typedef $$CatsTableCreateCompanionBuilder = CatsCompanion Function({
  required String id,
  required String imageUrl,
  required String breedName,
  Value<String?> description,
  Value<String?> origin,
  Value<String?> temperament,
  Value<String?> lifeSpan,
  Value<DateTime?> likedAt,
  Value<int> rowid,
});
typedef $$CatsTableUpdateCompanionBuilder = CatsCompanion Function({
  Value<String> id,
  Value<String> imageUrl,
  Value<String> breedName,
  Value<String?> description,
  Value<String?> origin,
  Value<String?> temperament,
  Value<String?> lifeSpan,
  Value<DateTime?> likedAt,
  Value<int> rowid,
});

class $$CatsTableFilterComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get temperament => $composableBuilder(
      column: $table.temperament, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lifeSpan => $composableBuilder(
      column: $table.lifeSpan, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get likedAt => $composableBuilder(
      column: $table.likedAt, builder: (column) => ColumnFilters(column));
}

class $$CatsTableOrderingComposer extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get temperament => $composableBuilder(
      column: $table.temperament, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lifeSpan => $composableBuilder(
      column: $table.lifeSpan, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get likedAt => $composableBuilder(
      column: $table.likedAt, builder: (column) => ColumnOrderings(column));
}

class $$CatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CatsTable> {
  $$CatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get temperament => $composableBuilder(
      column: $table.temperament, builder: (column) => column);

  GeneratedColumn<String> get lifeSpan =>
      $composableBuilder(column: $table.lifeSpan, builder: (column) => column);

  GeneratedColumn<DateTime> get likedAt =>
      $composableBuilder(column: $table.likedAt, builder: (column) => column);
}

class $$CatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CatsTable,
    Cat,
    $$CatsTableFilterComposer,
    $$CatsTableOrderingComposer,
    $$CatsTableAnnotationComposer,
    $$CatsTableCreateCompanionBuilder,
    $$CatsTableUpdateCompanionBuilder,
    (Cat, BaseReferences<_$AppDatabase, $CatsTable, Cat>),
    Cat,
    PrefetchHooks Function()> {
  $$CatsTableTableManager(_$AppDatabase db, $CatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> breedName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> origin = const Value.absent(),
            Value<String?> temperament = const Value.absent(),
            Value<String?> lifeSpan = const Value.absent(),
            Value<DateTime?> likedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CatsCompanion(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            origin: origin,
            temperament: temperament,
            lifeSpan: lifeSpan,
            likedAt: likedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String imageUrl,
            required String breedName,
            Value<String?> description = const Value.absent(),
            Value<String?> origin = const Value.absent(),
            Value<String?> temperament = const Value.absent(),
            Value<String?> lifeSpan = const Value.absent(),
            Value<DateTime?> likedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CatsCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            origin: origin,
            temperament: temperament,
            lifeSpan: lifeSpan,
            likedAt: likedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CatsTable,
    Cat,
    $$CatsTableFilterComposer,
    $$CatsTableOrderingComposer,
    $$CatsTableAnnotationComposer,
    $$CatsTableCreateCompanionBuilder,
    $$CatsTableUpdateCompanionBuilder,
    (Cat, BaseReferences<_$AppDatabase, $CatsTable, Cat>),
    Cat,
    PrefetchHooks Function()>;
typedef $$CachedCatsTableCreateCompanionBuilder = CachedCatsCompanion Function({
  required String id,
  required String imageUrl,
  required String breedName,
  Value<String?> description,
  Value<String?> origin,
  Value<String?> temperament,
  Value<String?> lifeSpan,
  Value<int> rowid,
});
typedef $$CachedCatsTableUpdateCompanionBuilder = CachedCatsCompanion Function({
  Value<String> id,
  Value<String> imageUrl,
  Value<String> breedName,
  Value<String?> description,
  Value<String?> origin,
  Value<String?> temperament,
  Value<String?> lifeSpan,
  Value<int> rowid,
});

class $$CachedCatsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get temperament => $composableBuilder(
      column: $table.temperament, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lifeSpan => $composableBuilder(
      column: $table.lifeSpan, builder: (column) => ColumnFilters(column));
}

class $$CachedCatsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get imageUrl => $composableBuilder(
      column: $table.imageUrl, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get breedName => $composableBuilder(
      column: $table.breedName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get origin => $composableBuilder(
      column: $table.origin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get temperament => $composableBuilder(
      column: $table.temperament, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lifeSpan => $composableBuilder(
      column: $table.lifeSpan, builder: (column) => ColumnOrderings(column));
}

class $$CachedCatsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCatsTable> {
  $$CachedCatsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  GeneratedColumn<String> get breedName =>
      $composableBuilder(column: $table.breedName, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get origin =>
      $composableBuilder(column: $table.origin, builder: (column) => column);

  GeneratedColumn<String> get temperament => $composableBuilder(
      column: $table.temperament, builder: (column) => column);

  GeneratedColumn<String> get lifeSpan =>
      $composableBuilder(column: $table.lifeSpan, builder: (column) => column);
}

class $$CachedCatsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CachedCatsTable,
    CachedCat,
    $$CachedCatsTableFilterComposer,
    $$CachedCatsTableOrderingComposer,
    $$CachedCatsTableAnnotationComposer,
    $$CachedCatsTableCreateCompanionBuilder,
    $$CachedCatsTableUpdateCompanionBuilder,
    (CachedCat, BaseReferences<_$AppDatabase, $CachedCatsTable, CachedCat>),
    CachedCat,
    PrefetchHooks Function()> {
  $$CachedCatsTableTableManager(_$AppDatabase db, $CachedCatsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedCatsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedCatsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedCatsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> imageUrl = const Value.absent(),
            Value<String> breedName = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> origin = const Value.absent(),
            Value<String?> temperament = const Value.absent(),
            Value<String?> lifeSpan = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCatsCompanion(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            origin: origin,
            temperament: temperament,
            lifeSpan: lifeSpan,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String imageUrl,
            required String breedName,
            Value<String?> description = const Value.absent(),
            Value<String?> origin = const Value.absent(),
            Value<String?> temperament = const Value.absent(),
            Value<String?> lifeSpan = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CachedCatsCompanion.insert(
            id: id,
            imageUrl: imageUrl,
            breedName: breedName,
            description: description,
            origin: origin,
            temperament: temperament,
            lifeSpan: lifeSpan,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CachedCatsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CachedCatsTable,
    CachedCat,
    $$CachedCatsTableFilterComposer,
    $$CachedCatsTableOrderingComposer,
    $$CachedCatsTableAnnotationComposer,
    $$CachedCatsTableCreateCompanionBuilder,
    $$CachedCatsTableUpdateCompanionBuilder,
    (CachedCat, BaseReferences<_$AppDatabase, $CachedCatsTable, CachedCat>),
    CachedCat,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CatsTableTableManager get cats => $$CatsTableTableManager(_db, _db.cats);
  $$CachedCatsTableTableManager get cachedCats =>
      $$CachedCatsTableTableManager(_db, _db.cachedCats);
}
