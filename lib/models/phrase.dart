class Phrase {
  final int id;
  final String phrase;
  final String type;
  final String moduleName;
  final String difficultyLevel;
  final String audioFileName;

  const Phrase({
    required this.id,
    required this.phrase,
    required this.type,
    required this.moduleName,
    required this.difficultyLevel,
    required this.audioFileName,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'phrase': phrase,
      'type': type,
      'module_name': moduleName,
      'difficulty_level': difficultyLevel,
      'audio_file_name': audioFileName
    };
  }

  @override
  String toString() {
    return 'Phrase{id: $id, phrase: $phrase, type: $type, module_name: $moduleName, difficulty_leve: $difficultyLevel, audio_file_name: $audioFileName';
  }
}
