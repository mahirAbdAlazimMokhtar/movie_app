import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movie_detail.dart';
import 'package:movies_app/movies/domain/use_cases/get_recommendation_movie_use_case.dart';
import '../../domain/entities/recommendation.dart';
import '../../domain/use_cases/get_movie_detail_use_case.dart';

part 'movie_detail_event.dart';

part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final GetMoviesDetailUseCase movieDetailUseCase;
  final GetRecommendationMovieUseCase getRecommendationMovieUseCase;

  MovieDetailBloc(
    this.movieDetailUseCase,
    this.getRecommendationMovieUseCase,
  ) : super(const MovieDetailState()) {
    on<GetMovieDetailsEvent>(_getMovieDetailsEvent);
    on<GetMovieRecommendationEvent>(_getMovieRecommendation);
  }

  FutureOr<void> _getMovieDetailsEvent(
      GetMovieDetailsEvent event, Emitter<MovieDetailState> emit) async {
    final result =
        await movieDetailUseCase(GetMovieDetailsParameters(movieID: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            movieDetailsRequestState: RequestState.error, message: l.message)),
        (r) => emit(state.copyWith(
            movieDetail: r, movieDetailsRequestState: RequestState.isLoaded)));
  }

  FutureOr<void> _getMovieRecommendation(
      GetMovieRecommendationEvent event, Emitter<MovieDetailState> emit) async {
    final result = await getRecommendationMovieUseCase(
        RecommendationParameters(id: event.id));

    result.fold(
        (l) => emit(state.copyWith(
            recommendationRequestState: RequestState.error,
            recommendationMessage: l.message)),
        (r) => emit(state.copyWith(
            recommendation: r,
            recommendationRequestState: RequestState.isLoaded)));
  }
}