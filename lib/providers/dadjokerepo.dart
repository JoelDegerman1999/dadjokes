import 'package:dad_jokes/model/dadjoke_response.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dadJokeRepoProvider = Provider<DadJokeRepo>((ref) {
  return DadJokeRepo(Dio());
});

class DadJokeRepo {
  final Dio dio;

  DadJokeRepo(this.dio);

  Future<DadJokeResponse> getDadJoke() async {
    var response = await dio.get("https://icanhazdadjoke.com/",
        options: Options(headers: {"Accept": "application/json"}));

    final dadjoke = DadJokeResponse.fromMap(response.data);
    return dadjoke;
  }
}
