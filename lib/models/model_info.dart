class ModelInfo {
  final String name;
  final String description;
  final String fileName;
  final String githubUrl;
  final String thumbnailUrl;
  final String category;
  final double scale;

  const ModelInfo({
    required this.name,
    required this.description,
    required this.fileName,
    required this.githubUrl,
    required this.thumbnailUrl,
    required this.category,
    this.scale = 1.0,
  });

  factory ModelInfo.fromJson(Map<String, dynamic> json) {
    return ModelInfo(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      fileName: json['fileName'] ?? '',
      githubUrl: json['githubUrl'] ?? '',
      thumbnailUrl: json['thumbnailUrl'] ?? '',
      category: json['category'] ?? 'General',
      scale: (json['scale'] ?? 1.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'fileName': fileName,
      'githubUrl': githubUrl,
      'thumbnailUrl': thumbnailUrl,
      'category': category,
      'scale': scale,
    };
  }
}


