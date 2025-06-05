import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../bloc/cat_bloc.dart';
import '../bloc/liked_cats_bloc.dart';
import '../../data/models/cat_model.dart';
import '../widgets/reaction_button.dart';
import '../widgets/cat_swipe_animation.dart';
import 'cat_details_screen.dart';

class CatExplorerScreen extends StatelessWidget {
  const CatExplorerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F1EC),
      appBar: AppBar(
        title: const Text('Cat Breed Explorer'),
        actions: [
          IconButton(
            icon: BlocBuilder<LikedCatsBloc, LikedCatsState>(
              builder: (context, state) {
                final count = state is LikedCatsUpdated ? state.cats.length : 0;
                return Badge(
                  label: Text('$count'),
                  child: const Icon(Icons.favorite),
                );
              },
            ),
            onPressed: () {
              Navigator.pushNamed(context, '/liked');
            },
          ),
        ],
      ),
      body: BlocConsumer<CatBloc, CatState>(
        listener: (context, state) {
          if (state is CatError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is ConnectivityStatus) {
            if (!state.isConnected) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('No internet connection. Showing cached data.'),
                  duration: Duration(seconds: 2),
                ),
              );
            }
          }
        },
        builder: (context, state) {
          if (state is CatLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatLoaded) {
            return _buildCatCard(context, state.cat);
          } else if (state is CatError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No cat available'));
        },
      ),
    );
  }

  Widget _buildCatCard(BuildContext context, Cat cat) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          cat.breedName,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: CatSwipeAnimation(
              onSwipe: (isLike) {
                if (isLike) {
                  context.read<LikedCatsBloc>().add(
                    AddLikedCatEvent(cat.copyWith(likedAt: DateTime.now())),
                  );
                }
                context.read<CatBloc>().add(LoadRandomCatEvent());
              },
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CatDetailsScreen(cat: cat),
                    ),
                  );
                },
                child: Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Hero(
                    tag: 'cat-image-${cat.id}',
                    child: CachedNetworkImage(
                      imageUrl: cat.imageUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ReactionButton(
              isLike: false,
              onPressed: () {
                context.read<CatBloc>().add(LoadRandomCatEvent());
              },
              size: 70,
            ),
            ReactionButton(
              isLike: true,
              onPressed: () {
                context.read<LikedCatsBloc>().add(
                  AddLikedCatEvent(cat.copyWith(likedAt: DateTime.now())),
                );
                context.read<CatBloc>().add(LoadRandomCatEvent());
              },
              size: 70,
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}