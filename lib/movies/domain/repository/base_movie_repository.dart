import 'package:dartz/dartz.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/entities/movie_entities.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_movie_use_case.dart';

import '../../../core/error/failure.dart';

abstract class BaseMovieRepository {
  Future<Either<Failure, List<Movie>>>getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>>getPopularMovies();
  Future<Either<Failure, List<Movie>>>getTopRatedMovies();
  Future<Either<Failure, MovieDetail>>getMoviesDetail(GetMovieDetailsParameters parameters);
  Future<Either<Failure, List<Recommendation>>>getRecommendationMovies(RecommendationParameters parameters);
}