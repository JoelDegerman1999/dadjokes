import 'package:dad_jokes/model/dadjoke_response.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dadJokeRepositoryProvider = Provider<DadJokeRepository>((ref) {
  return DadJokeRepository();
});

class DadJokeRepository {
  final Dio dio = Dio();

  Future<DadJokeResponse> getDadJoke() async {
    dio.options.headers['Accept'] = 'application/json';

    var response = await dio.get("https://icanhazdadjoke.com/");
    print(response);
    // return DadJokeResponse.fromJson(response.data as Map<String, dynamic>);
  }
}
