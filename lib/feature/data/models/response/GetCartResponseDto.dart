import 'package:ecommerce_app/feature/data/models/response/CategoryOrBrandsResponseDto.dart';
import 'package:ecommerce_app/feature/data/models/response/ProductResponseDto.dart';
import 'package:ecommerce_app/feature/domain/entities/GetCartResponseEntity.dart';

class GetCartResponseDto extends GetCartResponseEntity {
  GetCartResponseDto({
    super.status,
    super.numOfCartItems,
    super.data,
    this.message,
  });

  GetCartResponseDto.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    numOfCartItems = json['numOfCartItems'];
    data = json['data'] != null ? GetDataDto.fromJson(json['data']) : null;
  }

  String? message;
}

class GetDataDto extends GetDataEntity {
  GetDataDto({
    super.id,
    super.cartOwner,
    super.products,
    super.createdAt,
    super.updatedAt,
    super.v,
    super.totalCartPrice,
  });

  GetDataDto.fromJson(dynamic json) {
    id = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      products = [];
      json['products'].forEach((v) {
        products?.add(GetProductDto.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    v = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }
}

class GetProductDto extends GetProductEntity {
  GetProductDto({
    super.count,
    super.id,
    super.product,
    super.price,
  });

  GetProductDto.fromJson(dynamic json) {
    count = json['count'];
    id = json['_id'];
    product = json['product'] != null
        ? GetProductDataDto.fromJson(json['product'])
        : null;
    price = json['price'];
  }
}

class GetProductDataDto extends GetProductDataEntity {
  GetProductDataDto({
    super.subcategory,
    super.id,
    super.title,
    super.quantity,
    super.imageCover,
    super.category,
    super.brand,
    super.ratingsAverage,
  });

  GetProductDataDto.fromJson(dynamic json) {
    if (json['subcategory'] != null) {
      subcategory = [];
      json['subcategory'].forEach((v) {
        subcategory?.add(SubcategoryDto.fromJson(v));
      });
    }
    id = json['_id'];
    title = json['title'];
    quantity = json['quantity'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryOrBrandsResponseDto.fromJson(json['category'])
        : null;
    brand = json['brand'];
    ratingsAverage = json['ratingsAverage'];
    id = json['id'];
  }
}
