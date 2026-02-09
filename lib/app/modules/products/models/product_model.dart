class ProductModel {
  const ProductModel({required this.title, required this.price});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    title: json['title'] as String? ?? 'Unknown Product',
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
  );

  final String title;
  final double price;

  Map<String, dynamic> toJson() => {'name': title, 'price': price};
}
