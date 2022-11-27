import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommendation.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

class GetRecommendationMovieUseCase extends BaseUseCase
<
List<Recommendation>,RecommendationParameters>{
final BaseMovieRepository baseMovieRepository;
GetRecommendationMovieUseCase(this.baseMovieRepository);

@override
Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async{
return await baseMovieRepository.getRecommendationMovies(parameters);
}

}
class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters({required this.id});

  @override
  List<Object> get props => [id];

}