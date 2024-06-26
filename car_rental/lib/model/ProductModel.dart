//3. for every change in models, //flutter pub run build_runner build
import 'package:json_annotation/json_annotation.dart';

part 'ProductModel.g.dart';

//1. flutter clean
//2. flutter pub get

@JsonSerializable()
class Product{
  @JsonKey(name:'_id')
  String? id;
  String? name;
  // String? picture;
  String? model;
  String? capacity;
  String? power;
  String? colour;
  // String? image;
  Product(
    {
      this.id,
      this.name,
      this.model,
      this.capacity,
      this.power,
      this.colour,
      // this.image
       
    });

    factory Product.fromJson(Map<String, dynamic> json){
      return _$ProductFromJson(json);
    }
    Map<String, dynamic> toJson()=> _$ProductToJson(this);
}