import 'dart:convert';

class Word {
  Word({
    required this.id,
    required this.term,
    required this.difficultyLevel,
    required this.def,
    required this.moduleName,
    required this.audioFilename
  });

  int id;
  String term;
  String difficultyLevel;
  String def;
  String moduleName;
  String audioFilename;

  factory Word.fromRawJson(String str) => Word.wordFromJson(json.decode(str));

  String toRawJson() => json.encode(wordToJson());

  factory Word.wordFromJson(Map<String, dynamic> json) => Word(
    id: json["_id"],
    term: json["term"],
    difficultyLevel: json["difficulty_level"],
    def: json["def"],
    moduleName: json["module_name"],
    audioFilename: json["audio_file_name"],
  );

  Map<String, dynamic> wordToJson() => {
    "_id": id,
    "term": term,
    "difficulty_level": difficultyLevel,
    "def": def,
    "module_name": moduleName,
    "audio_file_name": audioFilename,
  };
}