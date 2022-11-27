import 'package:equatable/equatable.dart';

class MovieEvent extends Equatable{
  const MovieEvent();

  @override
  List<Object?> get props => [];
}

class GetNowPlayingMoviesEvent extends MovieEvent{}
class GetTopRatedMoviesEvent extends MovieEvent{}
class GetPopularMoviesEvent extends MovieEvent{}