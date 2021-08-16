class Product {
  final String image;
  final String name;
  final String details;
  final String price;
  final String installments;
  final int installmentsNumber;
  bool isFavorite;
  
  Product({
    required this.image,
    required this.name,
    required this.details,
    required this.price,
    required this.installments,
    required this.installmentsNumber,
    this.isFavorite = false
  });
}
