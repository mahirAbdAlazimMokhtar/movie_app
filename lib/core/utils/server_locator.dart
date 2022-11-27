
import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/data_source/movie_remote_data_source.dart';
import 'package:movies_app/movies/data/repository/movie_repository.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';
import 'package:movies_app/movies/domain/use_cases/get_movie_detail_use_case.dart';
import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_movie_use_case.dart';
import 'package:movies_app/movies/presentation/controller/movie_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movie_detail_bloc.dart';

import '../../movies/domain/use_cases/get_top_rated_movies_usecase.dart';

final sl = GetIt.instance;
class ServerLocator{
void setup(){
  sl.registerLazySingleton(() => MoviesBloc(sl(),sl(),sl()));
  sl.registerLazySingleton(() => MovieDetailBloc(sl(),sl()));
  //Data Source
  sl.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  //use case
  sl.registerLazySingleton(() => GetNowPlayingMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetTopRatedMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetNowPopularMoviesUseCase(sl()));
  sl.registerLazySingleton(() => GetMoviesDetailUseCase(sl()));
  sl.registerLazySingleton(() => GetRecommendationMovieUseCase(sl()));

  //Repository
  sl.registerLazySingleton<BaseMovieRepository>(() => MovieRepository(sl()));
}

}