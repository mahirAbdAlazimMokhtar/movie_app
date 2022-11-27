import 'package:equatable/equatable.dart';

import 'genres.dart';

class MovieDetail extends Equatable {
  final String overview, backdropPath, releaseData, title ;
  final int id, runTime;
  final List<Genres> genres;
  final double voteAverage;

  const MovieDetail(
      {required this.overview,
      required this.backdropPath,
      required this.genres,
      required this.releaseData,
      required this.title,
      required this.voteAverage,
      required this.id,
      required this.runTime});

  @override
  List<Object> get props => [
        overview,
        id,
        backdropPath,
        genres,
        releaseData,
        title,
        voteAverage,
        runTime
      ];
}