import 'package:dio/dio.dart';
import 'package:f290_dsm_pdm2_themoviedb_with_tests/pages/guiame_page.dart';
import 'package:f290_dsm_pdm2_themoviedb_with_tests/repository/movie_repository_impl.dart';
import 'package:f290_dsm_pdm2_themoviedb_with_tests/service/http_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
    providers: [
      Provider(create: (context) => Dio()),
      Provider(create: (context) => HttpManager(dio: context.read())),
      Provider(
          create: (context) => MovieRepositoryImpl(httpManager: context.read()))
    ],
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lançamentos',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(3, 37, 65, 1.0),
        ),
        colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromRGBO(3, 37, 65, 1.0))
            .copyWith(
          onPrimaryContainer: Colors.white,
          primaryContainer: const Color.fromRGBO(27, 210, 175, 1.0),
        ),
      ),
      home: const MyHomePage(title: 'TheMovieDB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder(
        future: context.read<MovieRepositoryImpl>().getUpcoming(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            return const Center(
              child: SizedBox(
                height: 200,
                width: 200,
                child: CircularProgressIndicator(),
              ),
            );
          }

          var data = snapshot.data;

          if (data?.isEmpty ?? true) {
            return const Center(
              child: Card(
                  child: Padding(
                padding: EdgeInsets.all(17.0),
                child: Text(
                  'Preencha o arquivo .env na raiz do projeto com a API_KEY e TOKEN para que as requisições possam e ser autenticadas corretamente, assim voce poderá consultar sua avaliações de favoritos posteriormente.',
                  style: TextStyle(
                    fontSize: 24,
                  ),
                  // textAlign: TextAlign.justify,
                ),
              )),
            );
          }

          return GridView.builder(
              itemCount: data?.length ?? 0,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 4,
                crossAxisCount: 2,
                childAspectRatio: 2 / 3,
                crossAxisSpacing: 4,
              ),
              itemBuilder: (context, index) {
                return FadeInImage(
                  fadeInCurve: Curves.bounceInOut,
                  fadeInDuration: const Duration(milliseconds: 500),
                  image: NetworkImage(data![index].getPostPathUrl()),
                  placeholder: const AssetImage('assets/images/logo.png'),
                );
                // return Image.network('${data?[index].getBackDropPath()}');
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
