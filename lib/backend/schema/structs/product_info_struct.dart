// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductInfoStruct extends BaseStruct {
  ProductInfoStruct({
    String? id,
    String? title,
    String? link,
    String? price,
    String? rating,
    int? totalRating,
    String? skinType,
    String? img,
  })  : _id = id,
        _title = title,
        _link = link,
        _price = price,
        _rating = rating,
        _totalRating = totalRating,
        _skinType = skinType,
        _img = img;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  // "price" field.
  String? _price;
  String get price => _price ?? '';
  set price(String? val) => _price = val;
  bool hasPrice() => _price != null;

  // "rating" field.
  String? _rating;
  String get rating => _rating ?? '';
  set rating(String? val) => _rating = val;
  bool hasRating() => _rating != null;

  // "total_rating" field.
  int? _totalRating;
  int get totalRating => _totalRating ?? 0;
  set totalRating(int? val) => _totalRating = val;
  void incrementTotalRating(int amount) => _totalRating = totalRating + amount;
  bool hasTotalRating() => _totalRating != null;

  // "skin_type" field.
  String? _skinType;
  String get skinType => _skinType ?? '';
  set skinType(String? val) => _skinType = val;
  bool hasSkinType() => _skinType != null;

  // "img" field.
  String? _img;
  String get img => _img ?? '';
  set img(String? val) => _img = val;
  bool hasImg() => _img != null;

  static ProductInfoStruct fromMap(Map<String, dynamic> data) =>
      ProductInfoStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        link: data['link'] as String?,
        price: data['price'] as String?,
        rating: data['rating'] as String?,
        totalRating: castToType<int>(data['total_rating']),
        skinType: data['skin_type'] as String?,
        img: data['img'] as String?,
      );

  static ProductInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'link': _link,
        'price': _price,
        'rating': _rating,
        'total_rating': _totalRating,
        'skin_type': _skinType,
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.String,
        ),
        'total_rating': serializeParam(
          _totalRating,
          ParamType.int,
        ),
        'skin_type': serializeParam(
          _skinType,
          ParamType.String,
        ),
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductInfoStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.String,
          false,
        ),
        totalRating: deserializeParam(
          data['total_rating'],
          ParamType.int,
          false,
        ),
        skinType: deserializeParam(
          data['skin_type'],
          ParamType.String,
          false,
        ),
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductInfoStruct &&
        id == other.id &&
        title == other.title &&
        link == other.link &&
        price == other.price &&
        rating == other.rating &&
        totalRating == other.totalRating &&
        skinType == other.skinType &&
        img == other.img;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([id, title, link, price, rating, totalRating, skinType, img]);
}

ProductInfoStruct createProductInfoStruct({
  String? id,
  String? title,
  String? link,
  String? price,
  String? rating,
  int? totalRating,
  String? skinType,
  String? img,
}) =>
    ProductInfoStruct(
      id: id,
      title: title,
      link: link,
      price: price,
      rating: rating,
      totalRating: totalRating,
      skinType: skinType,
      img: img,
    );
