class Snack {
  late String id;
  late double price;
  late String imageUrl;
  late String name;
  late String description;
  late bool active;

  Snack(
      {required this.price,
      required this.imageUrl,
      required this.name,
      required this.description,
      required this.active,
      required this.id});

  Snack.fromJson(Map<String, dynamic> json, String id) {
    this.id = id;
    price = json['price'].toDouble();
    imageUrl = json['imageUrl'];
    name = json['name'];
    description = json['description'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['imageUrl'] = this.imageUrl;
    data['name'] = this.name;
    data['description'] = this.description;
    data['active'] = this.active;
    return data;
  }
}
