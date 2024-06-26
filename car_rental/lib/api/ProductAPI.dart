import 'dart:io';

import 'package:car_rental/api/http.dart';
import 'package:car_rental/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';
import '../model/ProductModel.dart';
import '../response/ProductResponse.dart';




class ProductAPI{
  Future<bool> addProduct(File? file, Product product) async{
    try{
      var producturl= baseUrl+ addUrl;
      var dio= HttpServices().getDioInstance();
      MultipartFile? image;
      if(file!=null){
        var mimeType= lookupMimeType(file.path);

        image= await MultipartFile.fromFile(
          file.path,
          filename: file.path.split("/").last,
          contentType: MediaType("image", mimeType!.split("/")[1]),
        );
      }
      var formData= FormData.fromMap(
        {
          "image": image,
          "name": product.name,
          "model": product.model,
          "capacity": product.capacity,
          "power": product.power,
          "colour": product.colour
                    
        },
      );
      var response= await dio.post(producturl, data:formData,
      options: Options(
          headers: {
            HttpHeaders.authorizationHeader: "Bearer $token",
          },
        ),);

      if(response.statusCode==200){
        return true;
      }
      

    }
    catch (e) {
      throw Exception(e);
    }
    return false;
  }
    Future<ProductResponse?> getProducts() async {
      var url= '${baseUrl}product/displayall';
    //   debugPrint(url);
     Future.delayed(const Duration(seconds: 2), () {});
    ProductResponse? productResponse;
    try {
      // var url = baseUrl + productsUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.get(url);
      // print('Response data: $response');
      // if (response.statusCode == 200) {
        // print('response.data: ${response.data}');
        productResponse = ProductResponse.fromJson(response.data);
        print('this line is not executed.');
       
      // } else {
      //   productResponse = null;
      // }
    } catch (e) {
      throw Exception(e);
    }

    return productResponse;
  }
  Future<bool?> getDelete(String id) async {
    bool? productResponse = false;
    var url = baseUrl + getdelete;
    try {
      var dio = HttpServices().getDioInstance();
      Response response = await dio.delete(
        url + "/" + id,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + GetStorage().read('token')
          },
        ),
      );
      if (response.statusCode == 200) {
        productResponse  = true;
      }
    } catch (e) {
       print(e);
      throw Exception(e);
    }
    return productResponse ;
  }
}