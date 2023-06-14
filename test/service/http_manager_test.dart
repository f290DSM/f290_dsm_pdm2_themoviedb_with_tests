import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:f290_dsm_pdm2_themoviedb_with_tests/service/http_manager.dart';
import 'package:faker/faker.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import 'http_manager_test.mocks.dart';

@GenerateMocks([Dio])
const jsonUpCommingResponse = '''
{
    "dates": {
        "maximum": "2023-06-29",
        "minimum": "2023-06-06"
    },
    "page": 1,
    "results": [
        {
            "adult": false,
            "backdrop_path": "/9n2tJBplPbgR2ca05hS5CKXwP2c.jpg",
            "genre_ids": [
                16,
                10751,
                12,
                14,
                35
            ],
            "id": 502356,
            "original_language": "en",
            "original_title": "The Super Mario Bros. Movie",
            "overview": "Os irmãos Mario e Luigi, de ascendência italiana, vivem em Brooklyn (Nova Iorque), onde trabalham como canalizadores. Certo dia, durante um serviço de reparação de uma conduta de água, são sugados por um tubo e transportados para o Reino Cogumelo, um universo paralelo governado pela Princesa Peach. Sem saber do paradeiro do irmão, Mario vai ter de aprender a sobreviver naquele lugar, adquirindo capacidades bizarras mas que serão grandes mais-valias para destruir os planos de Bowser, um verdadeiro vilão que tenciona dominar o mundo.",
            "popularity": 3392.2,
            "poster_path": "/ktU3MIeZtuEVRlMftgp0HMX2WR7.jpg",
            "release_date": "2023-04-05",
            "title": "Super Mario Bros.: O Filme",
            "video": false,
            "vote_average": 7.8,
            "vote_count": 4327
        }
    ],
    "total_pages": 1,
    "total_results": 1
}
''';

void main() {
  late final Faker faker;
  late final MockDio mockDio;
  late final HttpManager sut;

  setUpAll(() {
    faker = Faker();
    mockDio = MockDio();
    sut = HttpManager(dio: mockDio);
  });

  test('Deve realizar com sucesso requisição http', () async {
    Map<String, dynamic> jsonResponse = jsonDecode(jsonUpCommingResponse);

    final url = faker.internet.httpUrl();
    final options = Options(method: HttpMethod.get);

    when(mockDio.request(url, options: options))
        .thenAnswer((realInvocation) => Future.value(
              Response(
                statusCode: 200,
                data: jsonResponse,
                requestOptions: RequestOptions(path: url),
              ),
            ));

    var response = await sut.sendRequest(url: url, options: options);

    var responseDio = await mockDio.request(url, options: options);

    verify(mockDio.request(url, options: options));
    expect(HttpStatus.ok, responseDio.statusCode);
    expect(response, isNotEmpty);
    expect(true, response.containsKey('results'));
  });

  test('Deve gerar com sucesso cabeçalho de autenticação http básica.', () {
    final header = {'Authorization': 'Basic ZXNkcmFzOnNlY3JldA=='};
    var simpleAuthHeader = sut.getSimpleAuthHeader('esdras', 'secret');
    expect(header, simpleAuthHeader);
  });
}
