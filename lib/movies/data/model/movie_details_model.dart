import 'package:movies_app/movies/data/model/genres_model.dart';

import '../../domain/entities/movie_detail.dart';

class MovieDetailsModel extends MovieDetail {
  const MovieDetailsModel(
      {required super.overview,
      required super.backdropPath,
      required super.genres,
      required super.releaseData,
      required super.title,
      required super.voteAverage,
      required super.id,
      required super.runTime});

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return MovieDetailsModel(
      overview: json['overview'],
      backdropPath: json['backdrop_path'],
      genres: List<GenresModel>.from(json['genres'].map((e) => GenresModel.fromJson(e))),
      releaseData: json['release_date'].toString(),
      title: json['title'],
      voteAverage: json['vote_average'].toDouble(),
      id: json['id'],
      runTime: json['runtime'],
    );
  }
}