import 'package:ecommerce_app/feature/domain/entities/CategoryOrBrandResponseEntity.dart';
import 'package:ecommerce_app/feature/domain/entities/ProductResponseEntity.dart';

class GetCartResponseEntity {
  GetCartResponseEntity({
    this.status,
    this.numOfCartItems,
    this.data,
  });

  String? status;
  int? numOfCartItems;
  GetDataEntity? data;
}

class GetDataEntity {
  GetDataEntity({
    this.id,
    this.cartOwner,
    this.products,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.totalCartPrice,
  });

  String? id;
  String? cartOwner;
  List<GetProductEntity>? products;
  String? createdAt;
  String? updatedAt;
  int? v;
  int? totalCartPrice;
}

class GetProductEntity {
  GetProductEntity({
    this.count,
    this.id,
    this.product,
    this.price,
  });

  int? count;
  String? id;
  GetProductDataEntity? product;
  int? price;
}

class GetProductDataEntity {
  GetProductDataEntity({
    this.subcategory,
    this.id,
    this.title,
    this.quantity,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
  });

  List<SubcategoryEntity>? subcategory;
  String? id;
  String? title;
  int? quantity;
  String? imageCover;
  CategoryOrBrandResponseEntity? category;
  dynamic brand;
  num? ratingsAverage;
}


