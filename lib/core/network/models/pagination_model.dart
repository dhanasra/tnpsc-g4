class PaginationModel {
  final int currentPage;
  final int totalPages;
  final int totalItems;

  PaginationModel({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
  });

  factory PaginationModel.fromJson(
    Map<String, dynamic> json,
  ) {
    return PaginationModel(
      currentPage: json['currentPage'],
      totalPages: json['totalPages'],
      totalItems: json['totalItems'],
    );
  }
}