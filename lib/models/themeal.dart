class Category {
  final String idCategory;
  final String name;
  final String thumbnail;
  final String description;

  Category({
    required this.idCategory,
    required this.name,
    required this.thumbnail,
    required this.description,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json['idCategory'] as String,
      name: json['strCategory'] as String,
      thumbnail: json['strCategoryThumb'] as String,
      description: json['strCategoryDescription'] as String,
    );
  }
}