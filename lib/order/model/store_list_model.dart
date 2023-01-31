class StoreListModel {
  String id;
  String title;
  String congestion;
  String rating;
  bool isSale;
  bool isNew;

  StoreListModel({
    required this.id,
    required this.title,
    required this.congestion,
    required this.rating,
    required this.isSale,
    required this.isNew,
  });
}
