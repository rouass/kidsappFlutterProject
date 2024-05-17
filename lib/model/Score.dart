class Score {
  String gameName;
  int _score;

  Score({required this.gameName, required int score}) : _score = score;

  int get score => _score;

  set score(int value) {
    _score = value;
  }
}
