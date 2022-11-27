import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';

import 'package:movies_app/movies/domain/use_cases/get_now_playing_movies_usecase.dart';
import 'package:movies_app/movies/domain/use_cases/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movie_event.dart';
import 'package:movies_app/movies/presentation/controller/movie_state.dart';

import '../../domain/use_cases/get_top_rated_movies_usecase.dart';

class MoviesBloc extends Bloc<MovieEvent, MovieState> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUseCase getTopRatedMoviesUseCase;
  final GetNowPopularMoviesUseCase getNowPopularMoviesUseCase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getTopRatedMoviesUseCase,
      this.getNowPopularMoviesUseCase)
      : super(const MovieState()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovie);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies) ;

  }

  FutureOr<void> _getNowPlayingMovie(
      GetNowPlayingMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPlayingMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            nowPlayingRequestState: RequestState.error,
            nowPlayingMessage: l.message)),
        (r) => emit(state.copyWith(
            nowPlayingMovie: r,
            nowPlayingRequestState: RequestState.isLoaded)));
  }

  FutureOr<void> _getTopRatedMovies(
      GetTopRatedMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getTopRatedMoviesUseCase(const NoParameters());

    result.fold(
        (l) => emit(state.copyWith(
            topRatedMovieRequestState: RequestState.error,
            topRatedMovieMessage: l.message)),
        (r) => emit(state.copyWith(
            topRatedMovie: r,
            topRatedMovieRequestState: RequestState.isLoaded)));
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MovieState> emit) async {
    final result = await getNowPopularMoviesUseCase(const NoParameters());
    result.fold(
            (l) => emit(state.copyWith(
            popularMovieRequestState: RequestState.error,
            popularMovieMessage: l.message)),
            (r) => emit(state.copyWith(
            popularMovie: r,
            popularMovieRequestState: RequestState.isLoaded)));

  }
}