import 'package:ecommerce_app/feature/domain/entities/GetAllSubCategoriesOnCategoryResponseEntity.dart';

class GetAllSubCategoriesOnCategoryResponseDto
    extends GetAllSubCategoriesOnCategoryResponseEntity {
  GetAllSubCategoriesOnCategoryResponseDto({
    super.results,
    this.metadata,
    this.statusMsg,
    this.message,
    super.data,
  });

  GetAllSubCategoriesOnCategoryResponseDto.fromJson(dynamic json) {
    results = json['results'];
    statusMsg = json['statusMsg'];
    message = json['message'];
    metadata =
        json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null;
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(SubCategoryDto.fromJson(v));
      });
    }
  }

  Metadata? metadata;
  String? statusMsg;
  String? message;
}

class SubCategoryDto extends SubCategoryEntity {
  SubCategoryDto({
    super.id,
    super.name,
    super.slug,
    super.category,
    super.createdAt,
    super.updatedAt,
  });

  SubCategoryDto.fromJson(dynamic json) {
    id = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['name'] = name;
    map['slug'] = slug;
    map['category'] = category;
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }
}

class Metadata {
  Metadata({
    this.currentPage,
    this.numberOfPages,
    this.limit,
  });

  Metadata.fromJson(dynamic json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
  }

  int? currentPage;
  int? numberOfPages;
  int? limit;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['currentPage'] = currentPage;
    map['numberOfPages'] = numberOfPages;
    map['limit'] = limit;
    return map;
  }
}
