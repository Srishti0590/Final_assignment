import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:car_rental/screens/wearos_screens/wearos_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:wear/wear.dart';
import 'package:motion_toast/motion_toast.dart';

import '../../repository/UserRepository.dart';

class LoginWearOS extends StatefulWidget {
  const LoginWearOS({ Key? key }) : super(key: key);

  @override
  State<LoginWearOS> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginWearOS> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
    int _counter = 1;
    _checkNotificationEnabled() {
      AwesomeNotifications().isNotificationAllowed().then((value) {
        if (value) {
          print("Notification allowed");
        } else {
          print("Notification not allowed");
          AwesomeNotifications().requestPermissionToSendNotifications();
        }
      });
    }

  _loginUser() async{
    bool isLogin = await UserRepository().loginUser(_emailController.text, _passwordController.text);
    if (isLogin){
     _showMessage(true);
     AwesomeNotifications().createNotification(
              content: NotificationContent(
            id: 1,
            channelKey: 'basic_channel',
            title: 'New Notification',
            body: 'You are logged in',
          ));
          setState(() {
            _counter++;
          });         
    }
    else{
      _showMessage(false);
    }
  }
  _showMessage(bool isLogin){
    if (isLogin){
       Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const DashboardWearOS())

      );
        
    }
    else{
      MotionToast.error(description: const Text("User login failed"),
      ).show(context);
    }
  }
 @override
  void initState() {
    super.initState();
    _checkNotificationEnabled();
  }

  @override
  Widget build(BuildContext context) {
    return WatchShape(
      builder: (BuildContext context, WearShape, Widget? child) {
    return AmbientMode( builder: (context, WearShape, Widget? child){
      return Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/login.jpg'),
        //     fit:BoxFit.cover
        //   ),
        // ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 170, 167, 167),
          body: Stack(
            children:[
              Container(
                padding: const EdgeInsets.only(left: 50, top:10),
              child:
               const Text('Login', style:TextStyle(color:Color.fromARGB(255, 160, 35, 35), fontSize: 20)
               )
          ),
          Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Container(
              
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.20, right: 35, left: 10),
                
                child: Column(
                  children:[
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0.2),
                        fillColor:const Color.fromARGB(221, 110, 110, 110),
                        filled: true,
                        hintText:'Enter your email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email address';
                            }
                            return null;
                          },
                    ),
          
                    const SizedBox(height:5),
                    TextFormField(
                      
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.symmetric(vertical: 0.5),
                        fillColor:const Color.fromARGB(221, 110, 110, 110),
                        filled: true,
                        hintText:'Enter password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter password';
                            }
                            return null;
                          },
                    ),
                    const SizedBox(
                      height:1
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          
                        Container(
                          
                          padding: const EdgeInsets.only(left: 20),
                          child: ElevatedButton( 
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _loginUser();
                                AwesomeNotifications().createNotification(
                                  content: NotificationContent(
                                    id:1,
                                    channelKey:'Basic_channel',
                                    title: 'Welcome user',
                                    body:'You are logged in',

                                  ),
                                );
                              }
                            },
                        
                           child: const Text(
                            'Login',
                          style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 218, 217, 219) ),
                          
                          )),
                        ),
                        // CircleAvatar(
                        //   radius:25, backgroundColor: Color(0xff4c505b),
                        //   child: IconButton(
                        //     color: Colors.red,
                        //     onPressed: (){},
                        //     icon: Icon(Icons.arrow_forward),
          
                        //   )
                        // )
                      ],
                    ),
                    
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
    );
      }
    );
    
      

    
  }
}