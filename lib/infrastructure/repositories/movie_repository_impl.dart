import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  final MoviesDatasource dataDatasource;

  MovieRepositoryImpl(this.dataDatasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return dataDatasource.getNowPlaying(page: page);
  }
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return dataDatasource.getPopular(page: page);
  }
  
  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return dataDatasource.getTopRated(page: page);
  }
  
  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return dataDatasource.getUpcoming(page: page);
  }
}
