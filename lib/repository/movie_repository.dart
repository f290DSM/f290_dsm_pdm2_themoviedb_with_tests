import 'package:f290_dsm_pdm2_themoviedb_with_tests/model/movie_model.dart';

abstract class MovieRepository {
  Future<List<MovieModel>> getUpcoming();
  Future<bool> addRating(String id, double rate);
}
