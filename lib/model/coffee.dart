class Coffee {
  String title;
  String description;
  List<String> ingredients;
  String image;
  int id;

  Coffee(this.title, this.description, this.ingredients, this.image, this.id);

  Coffee.fromJson(Map<String, dynamic> json):
    title = json['title'],
    description = json['description'],
    ingredients = json['ingredients'].cast<String>(),
    image = json['image'],
    id = json['id'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['description'] = description;
    data['ingredients'] = ingredients;
    data['image'] = image;
    data['id'] = id;
    return data;
  }

  @override
  bool operator ==(Object other) {
    return other is Coffee && other.id == id;
  }

  @override
  int get hashCode {
    return id;
  }
}