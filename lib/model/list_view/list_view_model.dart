class ListViewModel {
  int? id;
  int? discountPer;
  String? image;
  String? title;
  double? price;
  double? rating;
  String? tag;

  ListViewModel({
    this.id,
    this.discountPer,
    this.image,
    this.title,
    this.price,
    this.rating,
    this.tag,
  });

  static List<ListViewModel> listFromJson(List jsonList) {
    return jsonList.map((e) => ListViewModel.fromJson(e)).toList();
  }

  factory ListViewModel.fromJson(Map<String, dynamic> json) {
    return ListViewModel(
      id: json['id'] as int?,
      discountPer: json['discountPer'] as int?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      price: json['price'] as double?,
      rating: json['rating'] as double?,
      tag: json['tag'] as String?,
    );
  }
}
