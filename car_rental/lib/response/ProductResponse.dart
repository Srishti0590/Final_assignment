import '../model/ProductModel.dart';

//3. for every change in models, //flutter pub run build_runner build
import 'package:json_annotation/json_annotation.dart';

part 'ProductResponse.g.dart';

//1. flutter clean
//2. flutter pub get

@JsonSerializable()

class ProductResponse {

  bool? success;

  List<Product>? productResponse;

  ProductResponse({ this.success, this.productResponse});
  factory ProductResponse.fromJson(Map<String, dynamic> json){
    print(json);
      return _$ProductResponseFromJson(json);
    }
    Map<String, dynamic> toJson()=> _$ProductResponseToJson(this);

  //get data => null;





}