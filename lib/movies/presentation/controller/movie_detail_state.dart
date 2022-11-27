part of 'movie_detail_bloc.dart';

class MovieDetailState extends Equatable {
  final MovieDetail? movieDetail;
  final RequestState movieDetailsRequestState;
  final String message;

  //
  final List<Recommendation> recommendation;
  final RequestState recommendationRequestState;
  final String recommendationMessage;

  const MovieDetailState({
    this.movieDetail,
    this.movieDetailsRequestState = RequestState.isLoading,
    this.message = '',
    this.recommendation = const [],
    this.recommendationRequestState = RequestState.isLoading,
    this.recommendationMessage = '',
  });

  MovieDetailState copyWith({
    MovieDetail? movieDetail,
    RequestState? movieDetailsRequestState,
    String? message,
    List<Recommendation>? recommendation,
    RequestState? recommendationRequestState,
    String? recommendationMessage,
  }) {
    return MovieDetailState(
      message: message ?? this.message,
      movieDetail: movieDetail ?? this.movieDetail,
      movieDetailsRequestState:
      movieDetailsRequestState ?? this.movieDetailsRequestState,
      recommendation: recommendation ?? this.recommendation,
      recommendationMessage: recommendationMessage ??
          this.recommendationMessage,
      recommendationRequestState:recommendationRequestState?? this.recommendationRequestState,
    );
  }

  @override
  List<Object?> get props =>
      [
        movieDetail,
        movieDetailsRequestState,
        message,
        recommendation,
        recommendationRequestState,
        recommendationMessage,
      ];
}