class MedicineItem {
  final int id;
  final String image;
  final String title;
  final String type;
  final String size;
  final double price;
  final String? company;
  final int? category;
  final String? description;
  final String? constituents;
  final String? productId;
  final String? packSize;
  final String? dispensedIn;
  final int? availablePacks;
  final List<int>? similarProducts;
  final int? likes;

  const MedicineItem(
    this.id,
    this.image,
    this.title,
    this.type,
    this.size,
    this.price, {
    this.company,
    this.category,
    this.description,
    this.constituents,
    this.productId,
    this.packSize,
    this.dispensedIn,
    this.availablePacks,
    this.similarProducts,
    this.likes = 0,
  });
}
