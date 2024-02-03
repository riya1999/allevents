class Category {
  final String category;
  final String data;

  Category({required this.category, required this.data});

  factory Category.fromJson(dynamic json) {
    if (json is Map<String, dynamic>) {
      return Category(
        category: json['category'],
        data: json['data'],
      );
    } else {
      throw FormatException("Unexpected format received");
    }
  }
}