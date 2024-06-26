// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UserModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['_id'] as String?,
      fn: json['fn'] as String?,
      ln: json['ln'] as String?,
      age: json['age'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      password: json['password'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      '_id': instance.id,
      'fn': instance.fn,
      'ln': instance.ln,
      'age': instance.age,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
    };
