import 'package:movies_app/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({ super.backdropPath, required super.id});

  factory RecommendationModel.fromJson(Map<String,dynamic>json){
    return RecommendationModel(backdropPath: json['backdrop_path']??'/dompWVgGL1qZ84BkQMlxGwOhKb8.jpg', id: json['id']);
  }
}