class ItemModel {
  final String title;
  final String description;
  bool isActive;

  ItemModel({
    required this.title,
    required this.description,
    this.isActive = false,
  });
}