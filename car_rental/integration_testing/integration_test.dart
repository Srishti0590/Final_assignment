import 'package:car_rental/screens/NavigatorDrawerScreen.dart';
import 'package:car_rental/screens/RegisterPage.dart';
import 'package:car_rental/screens/addproduct.dart';
import 'package:car_rental/screens/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:integration_test/integration_test.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  group("User API test", (){
testWidgets('Registering a customer - TEST',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {'/register': (context) => const RegistrationPage()},
        home: const RegistrationPage(),
      ),
    );
    Finder fn = find.byKey(const ValueKey('fn'));
    await tester.enterText(fn, 'int');
    Finder ln = find.byKey(const ValueKey('ln'));
    await tester.enterText(ln, 'int');
    Finder age = find.byKey(const ValueKey('age'));
    await tester.enterText(age, '21');
    Finder email = find.byKey(const ValueKey('email'));
    await tester.enterText(email, 'inte@gmail.com');
     Finder phone= find.byKey(const ValueKey('phone'));
    await tester.enterText(phone, '987624');
    Finder pw = find.byKey(const ValueKey('password'));
    await tester.enterText(pw, '12345');
    Finder btnSignup = find.byKey(const ValueKey('btnSignup'));
    await tester.tap(btnSignup);
    await tester.pumpAndSettle();
    expect(find.text("Sign Up"), findsOneWidget);
  });

  testWidgets('Loging In - TEST',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {'/dashboard': (context) => const NavigationDrawerScreen()},
        home: const LoginPage(),
      ),
    );
    Finder email = find.byKey(const ValueKey('email'));
    await tester.enterText(email, 'admin');
    Finder pw = find.byKey(const ValueKey('password'));
    await tester.enterText(pw, 'admin');
    Finder btnlogin = find.byKey(const ValueKey('btnlogin'));
    await tester.tap(btnlogin);
    await tester.pumpAndSettle();
    expect(find.text("Sign In"), findsOneWidget);
  });
  });

  group("add Product and delete product", (){
    testWidgets('Adding a Product - TEST',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        routes: {'/dashboard': (context) => const NavigationDrawerScreen()},
        home: const AddVehicle(),
      ),
    );
    Finder name = find.byKey(const ValueKey('name'));
    await tester.enterText(name, 'abc');
    Finder model = find.byKey(const ValueKey('model'));
    await tester.enterText(model, 'abc');
    Finder capacity = find.byKey(const ValueKey('capacity'));
    await tester.enterText(capacity, '21');
    Finder power = find.byKey(const ValueKey('power'));
    await tester.enterText(power, '2400');
     Finder colour= find.byKey(const ValueKey('colour'));
    await tester.enterText(colour, '987624');
    Finder btnadd = find.byKey(const ValueKey('btnadd'));
    await tester.tap(btnadd);
    await tester.pumpAndSettle();
    expect(find.text("Add Product"), findsOneWidget);
  });

  });
  
  
}