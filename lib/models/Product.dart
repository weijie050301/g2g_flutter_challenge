class GameModel {
    GameModel({
        required this.count,
        this.next,
        this.previous,
        required this.products,
    });

    final int count;
    final String? next, previous;
    final List<Product> products;

    factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      products: List<Product>.from(json["results"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
      "products": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
  final int id;
  final String name, released, image, updated;
  final double rating;
  final List<ShortScreenshot> shortScreenshots;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.released,
    required this.updated,
    this.rating = 0.0,
    required this.shortScreenshots,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    name: json["name"],
    image: json["background_image"],
    released: json["released"],
    updated: json["updated"],
    rating: json["rating"],
    shortScreenshots: List<ShortScreenshot>.from(json["short_screenshots"].map((x) => ShortScreenshot.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "name": name,
      "background_image": image,
      "released": released,
      "updated": updated,
      "rating": rating,
      "short_screenshots": shortScreenshots,
  };
}

class ShortScreenshot {
  final int id;
  final String image;

  ShortScreenshot({
    required this.id,
    required this.image,
  });

  factory ShortScreenshot.fromJson(Map<String, dynamic> json) => ShortScreenshot(
    id: json["id"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
      "id": id,
      "image": image,
  };
}
