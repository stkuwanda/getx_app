class ProductModel {
  const ProductModel({required this.name, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    name: json['name'],
    price: (json['price'] as num).toDouble(),
  );

  final String name;
  final double price;

  Map<String, dynamic> toJson() => {'name': name, 'price': price};
}
