import 'package:cinemapedia/presentation/providers/providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final slideShowMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final topRatedMovies = ref.watch(moviesSlideshowProvider);
    final upcomingMovies = ref.watch(popularMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Column(
          children: [
            //const CustomAppbar(),
            MoviesSlideshow(movies: slideShowMovies),
            MovieHorizontalListView(
              movies: nowPlayingMovies,
              title: 'En cines',
              subTitle: 'Lunes 20',
              loadNextPage: () => ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListView(
              movies: popularMovies,
              title: 'Populares',
              subTitle: 'Ahora',
              loadNextPage: () => ref.read(popularMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListView(
              movies: upcomingMovies,
              title: 'Proximamente',
              subTitle: 'En estreno',
              loadNextPage: () => ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
            ),
            MovieHorizontalListView(
              movies: topRatedMovies,
              title: 'Mejores calificadas',
              subTitle: 'Desde siempre',
              loadNextPage: () => ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
            ),
          ],
        );}
        )),

      ],
    );
  }
}
