import 'package:equatable/equatable.dart';

import '../../../core/utils/enums.dart';
import '../../domain/entities/movie_entities.dart';

class MovieState extends Equatable {
  final List<Movie> nowPlayingMovie;
  final RequestState nowPlayingRequestState;
  final String nowPlayingMessage;

  //
  final List<Movie> topRatedMovie;
  final RequestState topRatedMovieRequestState;
  final String topRatedMovieMessage;

  //
  final List<Movie> popularMovie;
  final RequestState popularMovieRequestState;
  final String popularMovieMessage;

  const MovieState({
    this.nowPlayingMovie = const [],
    this.nowPlayingRequestState = RequestState.isLoading,
    this.nowPlayingMessage = '',
    this.topRatedMovie = const [],
    this.topRatedMovieRequestState = RequestState.isLoading,
    this.topRatedMovieMessage = '',
    this.popularMovie = const [],
    this.popularMovieRequestState = RequestState.isLoading,
    this.popularMovieMessage = '',
  });

  MovieState copyWith({
    List<Movie>? nowPlayingMovie,
    RequestState? nowPlayingRequestState,
    String? nowPlayingMessage,
    List<Movie>? topRatedMovie,
    RequestState? topRatedMovieRequestState,
    String? topRatedMovieMessage,
    List<Movie>? popularMovie,
    RequestState? popularMovieRequestState,
    String? popularMovieMessage,
  }) {
    return MovieState(
      nowPlayingRequestState: nowPlayingRequestState ?? this.nowPlayingRequestState ,
      nowPlayingMovie: nowPlayingMovie?? this.nowPlayingMovie ,
      nowPlayingMessage:  nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovie: popularMovie?? this.popularMovie ,
      popularMovieMessage: popularMovieMessage?? this.popularMovieMessage,
      popularMovieRequestState:  popularMovieRequestState?? this.popularMovieRequestState ,
      topRatedMovie: topRatedMovie ?? this.topRatedMovie ,
      topRatedMovieMessage:  topRatedMovieMessage ?? this.topRatedMovieMessage,
      topRatedMovieRequestState: topRatedMovieRequestState?? this.topRatedMovieRequestState
    );
  }

  @override
  List<Object> get props => [
        nowPlayingMovie,
        nowPlayingRequestState,
        nowPlayingMessage,
        topRatedMovie,
        topRatedMovieRequestState,
        topRatedMovieMessage,
        popularMovie,
        popularMovieRequestState,
        popularMovieMessage,
      ];
}