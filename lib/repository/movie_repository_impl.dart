// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:f290_dsm_pdm2_themoviedb_with_tests/model/movie_model.dart';
import 'package:f290_dsm_pdm2_themoviedb_with_tests/repository/movie_repository.dart';
import 'package:f290_dsm_pdm2_themoviedb_with_tests/service/http_manager.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

final apiKey = dotenv.env['API_KEY'];
final apiToken = dotenv.env['API_TOKEN'];

class MovieRepositoryImpl extends MovieRepository {
  final HttpManager httpManager;

  MovieRepositoryImpl({required this.httpManager});

  @override
  Future<bool> addRating(String id, double rate) async {
    final url = 'https://api.themoviedb.org/3/movie/$id/rating';
    final headers = {
      'Authorization': 'Bearer $apiToken',
    };

    var response = await httpManager.sendRequest(
      url: url,
      method: HttpMethod.post,
      headers: headers,
      body: {'value': rate},
    );

    return response.containsKey('success') ? response['success'] : false;
  }

  @override
  Future<List<MovieModel>> getUpcoming() async {
    final url =
        'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=pt-BR&page=1';

    List<MovieModel> movies = [];

    var response = await httpManager.sendRequest(
      url: url,
      method: HttpMethod.get,
    );

    if (response.containsKey('results')) {
      movies = response['results']
          .map<MovieModel>((m) => MovieModel.fromJson(m))
          .toList();
    }

    return movies;
  }
}
