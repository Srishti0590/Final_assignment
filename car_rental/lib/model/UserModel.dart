import 'package:json_annotation/json_annotation.dart';

part 'UserModel.g.dart';

//1. flutter clean
//2. flutter pub get
@JsonSerializable()
class User{
  @JsonKey(name:'_id')
  String? id;
  String? fn;
  String? ln;
  String? age;
  String? email;
  String? phone;
  String? password;

  User(
    {
    this.id,
    this.fn,
    this.ln,
    this.age,
    this.email,
    this.phone,
    this.password
    });
    factory User.fromJson(Map<String, dynamic> json){
      return _$UserFromJson(json);
    }
    Map<String, dynamic> toJson()=> _$UserToJson(this);
}