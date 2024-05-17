final String tableScores = 'scores';

class ScoreFields {
  static final String id = '_id';
  static final String gameName = 'gameName';
  static final String score = '_score'; 
  
  static final List<String> values = [
    id, gameName, score 
  ];
}

class Score {
  final int id;
  final String gameName;
  final int score; 

  const Score({
    required this.id,
    required this.gameName,
    required this.score,
  });

  Map<String, Object?> toJson() => {
    ScoreFields.id: id,
    ScoreFields.gameName: gameName,
    ScoreFields.score: score,
  };

  Score copy({
    int? id,
    String? gameName,
    int? score,
  }) =>
      Score(
        id: id ?? this.id,
        gameName: gameName ?? this.gameName,
        score: score ?? this.score,
      );

  static Score fromJson(Map<String, Object?> json) => Score(
        id: json[ScoreFields.id] as int,
        gameName: json[ScoreFields.gameName] as String,
        score: json[ScoreFields.score] as int,
      );
}
