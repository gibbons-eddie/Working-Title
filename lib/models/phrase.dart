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
}
