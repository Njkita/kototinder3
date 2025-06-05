import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:kototinder3/data/models/cat_model.dart';
import 'package:kototinder3/domain/repositories/cat_repository.dart';
import 'package:kototinder3/presentation/bloc/liked_cats_bloc.dart';

class MockCatRepository extends Mock implements CatRepository {}
class FakeCat extends Fake implements Cat {}

void main() {
  late LikedCatsBloc likedCatsBloc;
  late MockCatRepository mockRepository;

  setUpAll(() {
    registerFallbackValue(FakeCat());
  });

  setUp(() {
    mockRepository = MockCatRepository();
    likedCatsBloc = LikedCatsBloc(mockRepository);
  });

  tearDown(() {
    likedCatsBloc.close();
  });

  final testCat = Cat(
    id: '1',
    imageUrl: 'https://example.com/cat.jpg',
    breedName: 'Test Breed',
    likedAt: DateTime.now(),
  );

  final testCats = [
    testCat,
    Cat(
      id: '2',
      imageUrl: 'https://example.com/cat2.jpg',
      breedName: 'Another Breed',
      likedAt: DateTime.now(),
    ),
  ];

  group('LikedCatsBloc', () {
    test('initial state is LikedCatsInitial', () {
      expect(likedCatsBloc.state, isA<LikedCatsInitial>());
    });

    blocTest<LikedCatsBloc, LikedCatsState>(
      'emits [LikedCatsLoading, LikedCatsUpdated] when LoadLikedCatsEvent is added',
      build: () {
        when(() => mockRepository.getLikedCats()).thenAnswer((_) async => testCats);
        return likedCatsBloc;
      },
      act: (bloc) => bloc.add(LoadLikedCatsEvent()),
      expect: () => [
        isA<LikedCatsLoading>(),
        isA<LikedCatsUpdated>(),
      ],
      verify: (_) {
        verify(() => mockRepository.getLikedCats()).called(1);
      },
    );

    blocTest<LikedCatsBloc, LikedCatsState>(
      'emits [LikedCatsUpdated] when AddLikedCatEvent is added',
      build: () {
        when(() => mockRepository.likeCat(any())).thenAnswer((_) async {});
        when(() => mockRepository.getLikedCats()).thenAnswer((_) async => testCats);
        return likedCatsBloc;
      },
      act: (bloc) => bloc.add(AddLikedCatEvent(testCat)),
      expect: () => [
        isA<LikedCatsUpdated>(),
      ],
      verify: (_) {
        verify(() => mockRepository.likeCat(testCat)).called(1);
        verify(() => mockRepository.getLikedCats()).called(1);
      },
    );

    blocTest<LikedCatsBloc, LikedCatsState>(
      'emits [LikedCatsUpdated] when RemoveLikedCatEvent is added',
      build: () {
        when(() => mockRepository.unlikeCat(any())).thenAnswer((_) async {});
        when(() => mockRepository.getLikedCats()).thenAnswer((_) async => [testCats[1]]);
        return likedCatsBloc;
      },
      seed: () => LikedCatsUpdated(testCats, null),
      act: (bloc) => bloc.add(RemoveLikedCatEvent(testCat.id)),
      expect: () => [
        isA<LikedCatsUpdated>(),
      ],
      verify: (_) {
        verify(() => mockRepository.unlikeCat(testCat.id)).called(1);
        verify(() => mockRepository.getLikedCats()).called(1);
      },
    );

    blocTest<LikedCatsBloc, LikedCatsState>(
      'emits LikedCatsUpdated with filter when FilterLikedCatsEvent is added',
      build: () => likedCatsBloc,
      seed: () => LikedCatsUpdated(testCats, null),
      act: (bloc) => bloc.add(FilterLikedCatsEvent('Test Breed')),
      expect: () => [
        isA<LikedCatsUpdated>().having(
          (s) => s.filterBreed,
          'filterBreed',
          'Test Breed',
        ),
      ],
    );

    blocTest<LikedCatsBloc, LikedCatsState>(
      'clears filter when FilterLikedCatsEvent with null is added',
      build: () => likedCatsBloc,
      seed: () => LikedCatsUpdated(testCats, 'Test Breed'),
      act: (bloc) => bloc.add(FilterLikedCatsEvent(null)),
      expect: () => [
        isA<LikedCatsUpdated>().having(
          (s) => s.filterBreed,
          'filterBreed',
          null,
        ),
      ],
    );
  });
}