class PhraseOption {
  final int id;
  final String option;
  final bool correct;
  final bool advanced;
  final int phraseId;

  PhraseOption({
    required this.id,
    required this.option,
    required this.correct,
    required this.advanced,
    required this.phraseId,
  });

  factory PhraseOption.fromJson(Map<String, dynamic> json) => PhraseOption(
        id: json['id'],
        option: json['option'],
        correct: json['correct'] == 1,
        advanced: json['advanced'] == 1,
        phraseId: json['phrase_id'],
      );
}
