class Phrase {
  final int id;
  final String phrase;
  final String prompt;
  final String audioFile;
  final bool completed;
  final bool advancedCompleted;
  final int moduleId;

  Phrase(
      {required this.id,
      required this.phrase,
      required this.prompt,
      required this.audioFile,
      required this.completed,
      required this.advancedCompleted,
      required this.moduleId});

  factory Phrase.fromJson(Map<String, dynamic> json) => Phrase(
        id: json['id'],
        phrase: json['phrase'],
        prompt: json['prompt'],
        audioFile: json['audio_file'],
        completed: json['completed'] == 1,
        advancedCompleted: json['advanced_completed'] == 1,
        moduleId: json['module_id'],
      );
}
