import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/use_case/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movie_repository.dart';

import '../entities/movie_detail.dart';

class GetMoviesDetailUseCase extends BaseUseCase<MovieDetail, GetMovieDetailsParameters> {
  final BaseMovieRepository baseMovieRepository;

  GetMoviesDetailUseCase(this.baseMovieRepository);

  @override
  Future<Either<Failure, MovieDetail>> call(GetMovieDetailsParameters parameters) async {
    return await baseMovieRepository.getMoviesDetail(parameters);
  }

}

class GetMovieDetailsParameters extends Equatable {
  final int movieID;

  const GetMovieDetailsParameters({required this.movieID});

  @override
  List<Object> get props => [movieID];
}