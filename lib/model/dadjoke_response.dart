import 'dart:convert';

class DadJokeResponse {
  final String id;
  final String joke;
  final int status;

  DadJokeResponse(this.id, this.joke, this.status);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'joke': joke,
      'status': status,
    };
  }

  factory DadJokeResponse.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return DadJokeResponse(
      map['id'],
      map['joke'],
      map['status'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DadJokeResponse.fromJson(String source) =>
      DadJokeResponse.fromMap(json.decode(source));
}
