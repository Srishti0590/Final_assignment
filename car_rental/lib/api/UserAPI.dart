import 'package:car_rental/api/http.dart';
import 'package:car_rental/response/LoginResponse.dart';
import 'package:car_rental/utils/urls.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../model/UserModel.dart';

class UserAPI{
  Future<bool> registerUser (User user) async{
    bool isLogin=false;
    Response response;
    var url= baseUrl+ registerUrl;
    var dio = HttpServices().getDioInstance();

    try{
      response= await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode==200){
        return true;
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<bool> login(String username, String password) async{
    print(username);
    bool isLogin= false;
    try{
      var url= baseUrl+loginUrl;
      var dio= HttpServices().getDioInstance();

      var response= await dio.post(
        url,
        data:{
          "username": username,
          "password": password,
        },
      );
      if (response.statusCode==200){
        LoginResponse loginResponse= LoginResponse.fromJson(response.data);
        token=loginResponse.token;
        isLogin= true;
      }
    }
    catch(e){
      debugPrint(e.toString());
    }
    return isLogin;
  }
  
}