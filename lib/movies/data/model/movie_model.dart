import 'package:movies_app/movies/domain/entities/movie_entities.dart';

class MovieModel extends Movie {
  const MovieModel(
      {required super.id,
      required super.title,
      required super.voteAverage,
      required super.backdropPath,
      required super.genreIds,
      required super.overview,
      required super.releaseDate});

  factory MovieModel.fromJson(Map<String,dynamic>json){
      return MovieModel(id: json['id'],
          title: json['title'],
          voteAverage: json['vote_average'].toDouble(),
          backdropPath: json['backdrop_path'].toString(),
          genreIds: List<int>.from(json['genre_ids'].map((e) => e)),
          overview: json['overview'],
          releaseDate: json['release_date'].toString(),);
  }

// factory MovieModel.fromJson(Map<String, dynamic>json){
//   return MovieModel(
//     json['id'],
//     json['title'],
//     json['overview'],
//     json['backdrop_path"'],
//     List<int>.from(json['genre_ids'].map((e) => e)),
//     json['vote_average"'],
//     json['release_date'].toString(),);
// }
}