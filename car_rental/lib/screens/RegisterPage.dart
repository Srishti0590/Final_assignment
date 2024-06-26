import 'package:flutter/material.dart';
import 'package:car_rental/model/UserModel.dart';
import 'package:motion_toast/motion_toast.dart';
import 'package:car_rental/repository/UserRepository.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({ Key? key }) : super(key: key);

  @override
  State<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _firstnameController = TextEditingController();
  final _lastnameController = TextEditingController();
  final _ageController = TextEditingController();
  final _isAdminController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

_registerUser(User user) async{
    bool isLogin = await UserRepository().registerUser(user);
    if (isLogin){
     _showMessage(true); 
           
    }
    else{
      _showMessage(false);
    }
  }
  _showMessage(bool isLogin){
    if (isLogin){
       MotionToast.success(
        description: const Text("User registered successfully"),
      

      ).show(context);
    }
    else{
      MotionToast.error(description: const Text("User registration failed"),
      ).show(context);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/login.jpg'),
          fit:BoxFit.cover
        ),
      ),
      
      child: Scaffold(
        backgroundColor: const Color.fromARGB(0, 201, 199, 199),  
        appBar: AppBar(      
            title:
             const Text('Register', style:TextStyle(color:Color.fromARGB(255, 160, 35, 35), fontSize: 30, )
             )
        ,
          backgroundColor: const Color.fromARGB(0, 86, 161, 169),
        ),  
        body: Stack(
          
          children:[

        //     Container(
        //       padding: const EdgeInsets.only(left: 70, top:8), 
        //     child:
        //      const Text('Register', style:TextStyle(color:Color.fromARGB(255, 160, 35, 35), fontSize: 30)
        //      )
        // ),
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02, right: 50, left: 40),
              
              child: Column(
                children:[
                  TextFormField(
                    key: const ValueKey("fn"),

                    controller: _firstnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      
                      filled: false,
                      hintText:'Enter your firstname',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                    const SizedBox(height:15),
                  TextFormField(
                   key: const ValueKey("ln"),

                    controller: _lastnameController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
              
                    decoration: InputDecoration(
                      filled: false,
                      hintText:'Enter your lastname',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
        
                  const SizedBox(height:15),
                  TextFormField(
                     key: const ValueKey("age"),

                    controller: _ageController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    
                    decoration: InputDecoration(
                      filled: false,
                      hintText:'Enter your age',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                  const SizedBox(height:15),
                  TextFormField(
                    key: const ValueKey("email"),

                    controller: _emailController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText:'Enter your email address',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                  const SizedBox(height:15),
                  TextFormField(
                    key: const ValueKey("phone"),

                    controller: _phoneController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText:'Enter your phone number',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                   const SizedBox(height:15),
                  TextFormField(
                    key: const ValueKey("password"),

                    controller: _passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText:'Password',
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                        
                      Container(
                        padding: const EdgeInsets.only(left: 60),
                        child: ElevatedButton( 
                          
                          onPressed: () {
                            
                            if (_formKey.currentState!.validate()) {
                              User user = User(
                                fn: _firstnameController.text,
                                ln: _lastnameController.text,
                                age: _ageController.text,
                                email: _emailController.text, 
                                phone: _phoneController.text,
                                password: _passwordController.text,
                              );
                              _registerUser(user);

                            }
                          },
                          key: const ValueKey("btnSignup"),
                            style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 185, 43, 33),
                            ),
                      
                          child: const Text(
                          'Sign Up',
                        style: TextStyle(fontSize: 25, color: Colors.amber ),
                        
                        )),
                      ),
                    ],
                  ),
                  // Row(
                  //   children: [
                  //     TextButton(onPressed: (){
                  //       setState(() {
                  //         Navigator.pushNamed(context, '/');
                              
                  //       });
                  //     }, 
                  //     child:  Container(
                  //       padding: EdgeInsets.only(left: 120), 
                  //       child: Text('Back to Login',
                  //       style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 24, 20, 7), decoration: TextDecoration.underline, fontStyle: FontStyle.italic  ),
                  //        ),
                  //     )),
                  //   ],
                  // )
                ]
              )
            ),
          ),
        )
        ]
        )
        )
        );
    
      

    
  }
}