import 'package:pharmacy/app/assets.dart';
import 'package:pharmacy/models/models.dart';

const _delay = Duration(milliseconds: 1000);

const List<CategoryItem> _categories = [
  CategoryItem(1, 'Headache', Assets.assetsImagesCat1Headache, false),
  CategoryItem(2, 'Supplements', Assets.imagesSupplement, false),
  CategoryItem(3, 'Infants', Assets.imagesInfant, false),
  CategoryItem(4, 'Cough', Assets.imagesCough, false),
];

const List<MedicineItem> _userSuggestedMedicines = [
  MedicineItem(
      1, Assets.imagesParacetamol3, 'Paracetamol', 'Tablet', '500mg', 350.00),
  MedicineItem(
      2, Assets.imagesDoliprane, 'Doliprane', 'Capsule', '1000mg', 350.00),
  MedicineItem(
      3, Assets.imagesParacetamol, 'Paracetamol', 'Tablet', '500mg', 350.00),
  MedicineItem(
      4, Assets.imagesIburofen, 'Ibuprofen', 'Tablet', '500mg', 200.00),
  MedicineItem(5, Assets.imagesPanadol, 'Panadol', 'Tablet', '500mg', 350.00),
  MedicineItem(
      6, Assets.imagesIburophen2, 'Ibuprofen', 'Tablet', '500mg', 400.00),
  MedicineItem(
      7, Assets.imagesEmzor, 'Emzor Paracetamol', 'Tablet', '500mg', 600.00),
];

const List<MedicineItem> _medicines = [
  /// 1st category
  MedicineItem(
      1, Assets.imagesParacetamol, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 1),
  MedicineItem(
      2, Assets.imagesDoliprane, 'Doliprane', 'Capsule', '1000mg', 350.00,
      category: 1),
  MedicineItem(
      3, Assets.imagesParacetamol3, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 1),
  MedicineItem(4, Assets.imagesIburofen, 'Ibuprofen', 'Tablet', '500mg', 200.00,
      category: 1),
  MedicineItem(
      5, Assets.imagesParacetamol, 'Panadol', 'Tablet', '500mg', 350.00,
      category: 1),
  MedicineItem(
      6, Assets.imagesIburophen2, 'Ibuprofen', 'Tablet', '500mg', 400.00,
      category: 1),
  MedicineItem(
      7, Assets.imagesEmzor, 'Emzor Paracetamol', 'Tablet', '500mg', 600.00,
      category: 1),

  /// 2nd category
  MedicineItem(
      8, Assets.imagesDoliprane, 'Doliprane', 'Capsule', '1000mg', 350.00,
      category: 2),
  MedicineItem(5, Assets.imagesPanadol, 'Panadol', 'Tablet', '500mg', 350.00,
      category: 2),
  MedicineItem(6, Assets.imagesIburofen, 'Ibuprofen', 'Tablet', '500mg', 400.00,
      category: 2),
  MedicineItem(
      1, Assets.imagesParacetamol, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 2),
  MedicineItem(
      4, Assets.imagesIburophen2, 'Ibuprofen', 'Tablet', '500mg', 200.00,
      category: 2),
  MedicineItem(
      3, Assets.imagesParacetamol3, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 2),
  MedicineItem(
      7, Assets.imagesEmzor, 'Emzor Paracetamol', 'Tablet', '500mg', 600.00,
      category: 2),

  /// 3rd category
  MedicineItem(
      7, Assets.imagesEmzor, 'Emzor Paracetamol', 'Tablet', '500mg', 600.00,
      category: 3),
  MedicineItem(6, Assets.imagesIburofen, 'Ibuprofen', 'Tablet', '500mg', 400.00,
      category: 3),
  MedicineItem(
      3, Assets.imagesParacetamol, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 3),
  MedicineItem(
      2, Assets.imagesDoliprane, 'Doliprane', 'Capsule', '1000mg', 350.00,
      category: 3),
  MedicineItem(
      4, Assets.imagesIburophen2, 'Ibuprofen', 'Tablet', '500mg', 200.00,
      category: 3),
  MedicineItem(5, Assets.imagesPanadol, 'Panadol', 'Tablet', '500mg', 350.00,
      category: 3),
  MedicineItem(
      1, Assets.imagesParacetamol3, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 3),

  /// 4th category
  MedicineItem(
      4, Assets.imagesIburophen2, 'Ibuprofen', 'Tablet', '500mg', 400.00,
      category: 4),
  MedicineItem(
      2, Assets.imagesDoliprane, 'Doliprane', 'Capsule', '1000mg', 350.00,
      category: 4),
  MedicineItem(6, Assets.imagesIburofen, 'Ibuprofen', 'Tablet', '500mg', 400.00,
      category: 4),
  MedicineItem(
      1, Assets.imagesParacetamol, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 4),
  MedicineItem(5, Assets.imagesPanadol, 'Panadol', 'Tablet', '500mg', 350.00,
      category: 4),
  MedicineItem(
      3, Assets.imagesParacetamol3, 'Paracetamol', 'Tablet', '500mg', 350.00,
      category: 4),
  MedicineItem(
      7, Assets.imagesEmzor, 'Emzor Paracetamol', 'Tablet', '500mg', 600.00,
      category: 4),
];

final _carts = <CartItem>[];

class MedicineRepository {
  // final _category = <CategoryItem>[];

  Future<List<CategoryItem>> loadCategory() =>
      Future.delayed(_delay, () => _categories);

  Future<List<CategoryItem>> selectCategory(int categoryId) => Future.delayed(
      _delay,
      () => _categories.map((category) {
            if (categoryId == category.id) {
              return CategoryItem(
                  category.id, category.name, category.image, true);
            } else {
              return CategoryItem(
                  category.id, category.name, category.image, false);
            }
          }).toList());

  Future<List<MedicineItem>> loadMedicines(int categoryId) => Future.delayed(
      _delay,
      () => _medicines.where((medicine) {
            print(
                "ListItem id is ${medicine.category} and event id is ${categoryId}");

            return medicine.category == categoryId;
          }).toList());

  Future<List<MedicineItem>> searchMedicines(String query) => Future.delayed(
      _delay,
      () => _medicines
          .where((medicine) =>
              medicine.title.toLowerCase().contains(query.toLowerCase()))
          .toList());

  Future<List<MedicineItem>> loadSuggestedMedicines() =>
      Future.delayed(_delay, () => _userSuggestedMedicines);

  void addItemToCart(CartItem item) {
    _carts.add(item);
  }

  void removeItemFromCart(CartItem item) => _carts.remove(item);

  Future<List<CartItem>> loadCarts() =>
      Future.delayed(_delay, () => _carts);
}
