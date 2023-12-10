class GetAllSubCategoriesOnCategoryResponseEntity {
  GetAllSubCategoriesOnCategoryResponseEntity({
    this.results,
    this.data,
  });

  int? results;
  List<SubCategoryEntity>? data;
}

class SubCategoryEntity {
  SubCategoryEntity({
    this.id,
    this.name,
    this.slug,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  String? id;
  String? name;
  String? slug;
  String? category;
  String? createdAt;
  String? updatedAt;
}
