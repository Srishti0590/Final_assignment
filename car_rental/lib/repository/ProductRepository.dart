import 'dart:io';

// import 'package:batch28_api_starter/model/dropdown_category.dart';
import 'package:car_rental/model/ProductModel.dart';
import 'package:car_rental/response/ProductResponse.dart';

import '../api/ProductAPI.dart';

class ProductRepository {

  Future<bool> addProduct(
    File? file,
     Product product) async {
    return ProductAPI().addProduct(file, product);
  }

  Future<ProductResponse?> getProducts() async {
    return ProductAPI().getProducts();
  }

  // Future<bool?> getDelete(String id) async {
  //   bool? bloggingResponse = false;
  //   var url = baseUrl + getdelete;
  //   try {
  //     var dio = HttpServices().getDioInstance();
  //     Response response = await dio.delete(
  //       url + "/" + id,
  //       options: Options(
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Accept': 'application/json',
  //           'Authorization': 'Bearer ' + GetStorage().read('token')
  //         },
  //       ),
  //     );
  //     if (response.statusCode == 200) {
  //       bloggingResponse  = true;
  //     }
  //   } catch (e) {
  //     // print(e);
  //     throw Exception(e);
  //   }
  //   return bloggingResponse ;
  // }

 
}
