import 'package:dad_jokes/model/dadjoke_response.dart';
import 'package:dad_jokes/providers/dadjoke_repository.dart';
import 'package:hooks_riverpod/all.dart';

final dadJokeControllerProvider =
    StateNotifierProvider<DadJokeController>((ref) {
  final dadJokeRepository = ref.watch(dadJokeRepositoryProvider);
  return DadJokeController(dadJokeRepository);
});

class DadJokeController extends StateNotifier<DadJokeResponse> {
  DadJokeController(this._dadJokeRepository)
      : super(DadJokeResponse(null, null, null));

  final DadJokeRepository _dadJokeRepository;

  Future<DadJokeResponse> getDadJoke() async {
    final result = await _dadJokeRepository.getDadJoke();
    state = result;
    return result;
  }
}
