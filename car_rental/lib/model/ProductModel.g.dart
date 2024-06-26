// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ProductModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      model: json['model'] as String?,
      capacity: json['capacity'] as String?,
      power: json['power'] as String?,
      colour: json['colour'] as String?,
      //image: json['image'] as String?,
    );
    

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      // 'picture': instance.picture,
      'model': instance.model,
      'capacity': instance.capacity,
      'power': instance.power,
      'colour': instance.colour,
      //'image': instance.image,
    };
