



import 'package:car_rental/model/UserModel.dart';
import 'package:car_rental/repository/ProductRepository.dart';
import 'package:car_rental/repository/UserRepository.dart';
import 'package:flutter_test/flutter_test.dart';




void main() {
  late UserRepository? userRespository;
  setUp(() {
    userRespository = UserRepository();
  });
  group('User API Test', () {
    test('user registration', () async {
      bool expectedResult = true;
      User user = User(
        fn: "testing",
        ln: "testing",
        age: "21",
        email: "testing@gmail.com",
        password: "12345",
      );
      bool actualResult = await userRespository!.registerUser(user);
      expect(actualResult, expectedResult);
    });
    test('Login user', () async {
      bool expectedResult = true;
      String email = "admin";
      String password = "admin";
      bool actualResult = await userRespository!.loginUser(email, password);
      expect(actualResult, expectedResult);
    });
    tearDown(() {
      userRespository = null;
    });

  });
  late ProductRepository? productRepository;
  setUp(() {
    productRepository = ProductRepository();
  });
  // test('Add Products', () async {
  //   bool expectedResult = true;
    
  //   Product product=Product(
  //    name : "Hyundai",
  //    model : "c310",
  //   capacity : "6",
  //    power : "2-6",
  //    colour : "red",
  //   );
    


  //   var file;
  //   bool actualResult = await productRepository!.addProduct(file!, product);
  //   expect(actualResult, expectedResult);
  // });
  // tearDown(() {
  //   productRepository = null;
  // });

}


