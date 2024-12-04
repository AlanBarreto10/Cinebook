import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/datasources/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  static Movie movieDbToEntity(MovieMovieDB moviebd) => Movie(
      adult: moviebd.adult,
      backdropPath: (moviebd.backdropPath != '')
          ? "https://image.tmdb.org/t/p/w500${moviebd.backdropPath}"
          : "https://www.shutterstock.com/image-vector/no-image-available-vector-illustration-260nw-744886198.jpg",
      genreIds: moviebd.genreIds.map((e) => e.toString()).toList(),
      id: moviebd.id,
      originalLanguage: moviebd.originalLanguage,
      originalTitle: moviebd.originalTitle,
      overview: moviebd.overview,
      popularity: moviebd.popularity,
      posterPath: (moviebd.posterPath != '')
          ? "https://image.tmdb.org/t/p/w500${moviebd.posterPath}"
          : "no-poster",
      releaseDate: moviebd.releaseDate,
      title: moviebd.title,
      video: moviebd.video,
      voteAverage: moviebd.voteAverage,
      voteCount: moviebd.voteCount);
}
