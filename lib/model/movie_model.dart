// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel {
  int id = 0;
  bool? adult = false;
  @JsonKey(name: 'backdrop_path')
  String backdropPath = '';
  @JsonKey(name: 'original_language')
  String originalLanguage = '';
  @JsonKey(name: 'original_title')
  String originalTitle = '';
  String overview = '';
  double popularity = 0;
  @JsonKey(name: 'poster_path')
  String posterPath = '';
  @JsonKey(name: 'release_date')
  String releaseDate = '';
  String title = '';
  @JsonKey(name: 'vote_average')
  double voteAverage = 0;
  @JsonKey(name: 'vote_count')
  int voteCount = 0;
  MovieModel({
    required this.id,
    this.adult,
    required this.backdropPath,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  String toString() {
    return 'MovieModel(id: $id, adult: $adult, backdropPath: $backdropPath, originalLanguage: $originalLanguage, originalTitle: $originalTitle, overview: $overview, popularity: $popularity, posterPath: $posterPath, releaseDate: $releaseDate, title: $title, voteAverage: $voteAverage, voteCount: $voteCount)';
  }

  //TODO: Quem conclui, pode executar o comando
  //flutter pub run build_runner build
}
