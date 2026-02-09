class ProductModel {
  const ProductModel({required this.title, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    title: json['name'],
    price: (json['price'] as num).toDouble(),
  );

  final String title;
  final double price;

  Map<String, dynamic> toJson() => {'name': title, 'price': price};
}
