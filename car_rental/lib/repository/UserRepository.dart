import 'package:car_rental/api/UserAPI.dart';

import '../model/UserModel.dart';

class UserRepository{
  Future<bool> registerUser(User user) async{
    return await UserAPI().registerUser(user);
  }

  Future<bool> loginUser(String username, String password) async{
    return await UserAPI().login(username, password);
  }


}