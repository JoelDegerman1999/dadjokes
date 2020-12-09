import 'package:dad_jokes/gradiantappbar.dart';
import 'package:dad_jokes/model/dadjoke_response.dart';
import 'package:dad_jokes/providers/dadjokerepo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

final dadJokeFutureProvider =
    FutureProvider.autoDispose<DadJokeResponse>((ref) async {
  final dadjoke = ref.watch(dadJokeRepoProvider).getDadJoke();
  return dadjoke;
});

class Homepage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Dad jokes",
        gradientBegin: Colors.blue,
        gradientEnd: Colors.blue[900],
      ),
      body: Center(
        child: watch(dadJokeFutureProvider).when(
          data: (value) => RefreshIndicator(
            onRefresh: () => context.refresh(dadJokeFutureProvider),
            child: Stack(
              children: [ListView(), Center(child: Joke(value.joke))],
            ),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
          error: (error, stackTrace) => Text(error),
        ),
      ),
    );
  }
}

class Joke extends StatelessWidget {
  final String joke;

  const Joke(this.joke);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Text(
            joke,
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
