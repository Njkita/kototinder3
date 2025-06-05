import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:kototinder3/data/models/cat_model.dart';
import 'package:kototinder3/domain/repositories/cat_repository.dart';
import 'package:kototinder3/presentation/bloc/cat_bloc.dart';

class MockCatRepository extends Mock implements CatRepository {}
class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late CatBloc catBloc;
  late MockCatRepository mockRepository;
  late MockConnectivity mockConnectivity;

  setUp(() {
    mockRepository = MockCatRepository();
    mockConnectivity = MockConnectivity();
    catBloc = CatBloc(mockRepository, connectivity: mockConnectivity);
  });

  tearDown(() {
    catBloc.close();
  });

  final testCat = Cat(
    id: '1',
    imageUrl: 'https://example.com/cat.jpg',
    breedName: 'Test Breed',
  );

  group('CatBloc', () {
    test('initial state is CatInitial', () {
      expect(catBloc.state, isA<CatInitial>());
    });

    blocTest<CatBloc, CatState>(
      'emits [CatLoading, CatLoaded] when LoadRandomCatEvent is added and fetch succeeds',
      build: () {
        when(() => mockRepository.fetchRandomCat()).thenAnswer((_) async => testCat);
        when(() => mockRepository.isCatLiked(any())).thenAnswer((_) async => false);
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.wifi]);
        return catBloc;
      },
      act: (bloc) => bloc.add(LoadRandomCatEvent()),
      expect: () => [
        isA<CatLoading>(),
        isA<CatLoaded>(),
      ],
      verify: (_) {
        verify(() => mockRepository.fetchRandomCat()).called(1);
        verify(() => mockRepository.isCatLiked(any())).called(1);
      },
    );

    blocTest<CatBloc, CatState>(
      'emits [CatLoading, CatError] when LoadRandomCatEvent is added and fetch fails',
      build: () {
        when(() => mockRepository.fetchRandomCat()).thenThrow(Exception('Failed'));
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.wifi]);
        return catBloc;
      },
      act: (bloc) => bloc.add(LoadRandomCatEvent()),
      expect: () => [
        isA<CatLoading>(),
        isA<CatError>(),
      ],
    );

    blocTest<CatBloc, CatState>(
      'emits ConnectivityStatus when CheckConnectivityEvent is added',
      build: () {
        when(() => mockConnectivity.checkConnectivity())
            .thenAnswer((_) async => [ConnectivityResult.wifi]);
        return catBloc;
      },
      act: (bloc) => bloc.add(CheckConnectivityEvent()),
      expect: () => [
        isA<ConnectivityStatus>(),
      ],
    );
  });
}