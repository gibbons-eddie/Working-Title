class Module {
  final int id;
  final String name;
  final String iconFile;

  Module({
    required this.id,
    required this.name,
    required this.iconFile,
  });

  factory Module.fromJson(Map<String, dynamic> json) => Module(
        id: json['id'],
        name: json['name'],
        iconFile: json['icon_file'],
      );
}
